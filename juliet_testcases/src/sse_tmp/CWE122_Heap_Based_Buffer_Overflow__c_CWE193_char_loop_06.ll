; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !44
  %call1 = call i64 @strlen(i8* %arraydecay) #9, !dbg !45
  store i64 %call1, i64* %sourceLen, align 8, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !50
  %3 = load i64, i64* %sourceLen, align 8, !dbg !52
  %add = add i64 %3, 1, !dbg !53
  %cmp2 = icmp ult i64 %2, %add, !dbg !54
  br i1 %cmp2, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !58
  %5 = load i8, i8* %arrayidx, align 1, !dbg !58
  %6 = load i8*, i8** %data, align 8, !dbg !59
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !59
  store i8 %5, i8* %arrayidx3, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %8, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !68
  call void @printLine(i8* %9), !dbg !69
  %10 = load i8*, i8** %data, align 8, !dbg !70
  call void @free(i8* %10) #7, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #7, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #7, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i8* null, i8** %data, align 8, !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  %cmp = icmp eq i8* %0, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !117
  %call1 = call i64 @strlen(i8* %arraydecay) #9, !dbg !118
  store i64 %call1, i64* %sourceLen, align 8, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !123
  %3 = load i64, i64* %sourceLen, align 8, !dbg !125
  %add = add i64 %3, 1, !dbg !126
  %cmp2 = icmp ult i64 %2, %add, !dbg !127
  br i1 %cmp2, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !131
  %5 = load i8, i8* %arrayidx, align 1, !dbg !131
  %6 = load i8*, i8** %data, align 8, !dbg !132
  %7 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !132
  store i8 %5, i8* %arrayidx3, align 1, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %8, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !140
  call void @printLine(i8* %9), !dbg !141
  %10 = load i8*, i8** %data, align 8, !dbg !142
  call void @free(i8* %10) #7, !dbg !143
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !146, metadata !DIExpression()), !dbg !147
  store i8* null, i8** %data, align 8, !dbg !148
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !149
  store i8* %call, i8** %data, align 8, !dbg !152
  %0 = load i8*, i8** %data, align 8, !dbg !153
  %cmp = icmp eq i8* %0, null, !dbg !155
  br i1 %cmp, label %if.then, label %if.end, !dbg !156

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !157
  unreachable, !dbg !157

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !159, metadata !DIExpression()), !dbg !161
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !161
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !164, metadata !DIExpression()), !dbg !165
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !166
  %call1 = call i64 @strlen(i8* %arraydecay) #9, !dbg !167
  store i64 %call1, i64* %sourceLen, align 8, !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !172
  %3 = load i64, i64* %sourceLen, align 8, !dbg !174
  %add = add i64 %3, 1, !dbg !175
  %cmp2 = icmp ult i64 %2, %add, !dbg !176
  br i1 %cmp2, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !180
  %5 = load i8, i8* %arrayidx, align 1, !dbg !180
  %6 = load i8*, i8** %data, align 8, !dbg !181
  %7 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !181
  store i8 %5, i8* %arrayidx3, align 1, !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !185
  %inc = add i64 %8, 1, !dbg !185
  store i64 %inc, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !189
  call void @printLine(i8* %9), !dbg !190
  %10 = load i8*, i8** %data, align 8, !dbg !191
  call void @free(i8* %10) #7, !dbg !192
  ret void, !dbg !193
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06_bad", scope: !15, file: !15, line: 32, type: !16, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 34, type: !4)
!19 = !DILocation(line: 34, column: 12, scope: !14)
!20 = !DILocation(line: 35, column: 10, scope: !14)
!21 = !DILocation(line: 39, column: 24, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 37, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 8)
!24 = !DILocation(line: 39, column: 14, scope: !22)
!25 = !DILocation(line: 40, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 40, column: 13)
!27 = !DILocation(line: 40, column: 18, scope: !26)
!28 = !DILocation(line: 40, column: 13, scope: !22)
!29 = !DILocation(line: 40, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 40, column: 27)
!31 = !DILocalVariable(name: "source", scope: !32, file: !15, line: 43, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 11)
!36 = !DILocation(line: 43, column: 14, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 44, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 44, column: 16, scope: !32)
!42 = !DILocalVariable(name: "sourceLen", scope: !32, file: !15, line: 44, type: !38)
!43 = !DILocation(line: 44, column: 19, scope: !32)
!44 = !DILocation(line: 45, column: 28, scope: !32)
!45 = !DILocation(line: 45, column: 21, scope: !32)
!46 = !DILocation(line: 45, column: 19, scope: !32)
!47 = !DILocation(line: 48, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !32, file: !15, line: 48, column: 9)
!49 = !DILocation(line: 48, column: 14, scope: !48)
!50 = !DILocation(line: 48, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !15, line: 48, column: 9)
!52 = !DILocation(line: 48, column: 25, scope: !51)
!53 = !DILocation(line: 48, column: 35, scope: !51)
!54 = !DILocation(line: 48, column: 23, scope: !51)
!55 = !DILocation(line: 48, column: 9, scope: !48)
!56 = !DILocation(line: 50, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !15, line: 49, column: 9)
!58 = !DILocation(line: 50, column: 23, scope: !57)
!59 = !DILocation(line: 50, column: 13, scope: !57)
!60 = !DILocation(line: 50, column: 18, scope: !57)
!61 = !DILocation(line: 50, column: 21, scope: !57)
!62 = !DILocation(line: 51, column: 9, scope: !57)
!63 = !DILocation(line: 48, column: 41, scope: !51)
!64 = !DILocation(line: 48, column: 9, scope: !51)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 51, column: 9, scope: !48)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 52, column: 19, scope: !32)
!69 = !DILocation(line: 52, column: 9, scope: !32)
!70 = !DILocation(line: 53, column: 14, scope: !32)
!71 = !DILocation(line: 53, column: 9, scope: !32)
!72 = !DILocation(line: 55, column: 1, scope: !14)
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_06_good", scope: !15, file: !15, line: 118, type: !16, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 120, column: 5, scope: !73)
!75 = !DILocation(line: 121, column: 5, scope: !73)
!76 = !DILocation(line: 122, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 134, type: !78, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !15, line: 134, type: !80)
!83 = !DILocation(line: 134, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !15, line: 134, type: !81)
!85 = !DILocation(line: 134, column: 27, scope: !77)
!86 = !DILocation(line: 137, column: 22, scope: !77)
!87 = !DILocation(line: 137, column: 12, scope: !77)
!88 = !DILocation(line: 137, column: 5, scope: !77)
!89 = !DILocation(line: 139, column: 5, scope: !77)
!90 = !DILocation(line: 140, column: 5, scope: !77)
!91 = !DILocation(line: 141, column: 5, scope: !77)
!92 = !DILocation(line: 144, column: 5, scope: !77)
!93 = !DILocation(line: 145, column: 5, scope: !77)
!94 = !DILocation(line: 146, column: 5, scope: !77)
!95 = !DILocation(line: 148, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 64, type: !4)
!98 = !DILocation(line: 64, column: 12, scope: !96)
!99 = !DILocation(line: 65, column: 10, scope: !96)
!100 = !DILocation(line: 74, column: 24, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !15, line: 72, column: 5)
!102 = distinct !DILexicalBlock(scope: !96, file: !15, line: 66, column: 8)
!103 = !DILocation(line: 74, column: 14, scope: !101)
!104 = !DILocation(line: 75, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 75, column: 13)
!106 = !DILocation(line: 75, column: 18, scope: !105)
!107 = !DILocation(line: 75, column: 13, scope: !101)
!108 = !DILocation(line: 75, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 75, column: 27)
!110 = !DILocalVariable(name: "source", scope: !111, file: !15, line: 78, type: !33)
!111 = distinct !DILexicalBlock(scope: !96, file: !15, line: 77, column: 5)
!112 = !DILocation(line: 78, column: 14, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !111, file: !15, line: 79, type: !38)
!114 = !DILocation(line: 79, column: 16, scope: !111)
!115 = !DILocalVariable(name: "sourceLen", scope: !111, file: !15, line: 79, type: !38)
!116 = !DILocation(line: 79, column: 19, scope: !111)
!117 = !DILocation(line: 80, column: 28, scope: !111)
!118 = !DILocation(line: 80, column: 21, scope: !111)
!119 = !DILocation(line: 80, column: 19, scope: !111)
!120 = !DILocation(line: 83, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !15, line: 83, column: 9)
!122 = !DILocation(line: 83, column: 14, scope: !121)
!123 = !DILocation(line: 83, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !15, line: 83, column: 9)
!125 = !DILocation(line: 83, column: 25, scope: !124)
!126 = !DILocation(line: 83, column: 35, scope: !124)
!127 = !DILocation(line: 83, column: 23, scope: !124)
!128 = !DILocation(line: 83, column: 9, scope: !121)
!129 = !DILocation(line: 85, column: 30, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !15, line: 84, column: 9)
!131 = !DILocation(line: 85, column: 23, scope: !130)
!132 = !DILocation(line: 85, column: 13, scope: !130)
!133 = !DILocation(line: 85, column: 18, scope: !130)
!134 = !DILocation(line: 85, column: 21, scope: !130)
!135 = !DILocation(line: 86, column: 9, scope: !130)
!136 = !DILocation(line: 83, column: 41, scope: !124)
!137 = !DILocation(line: 83, column: 9, scope: !124)
!138 = distinct !{!138, !128, !139, !67}
!139 = !DILocation(line: 86, column: 9, scope: !121)
!140 = !DILocation(line: 87, column: 19, scope: !111)
!141 = !DILocation(line: 87, column: 9, scope: !111)
!142 = !DILocation(line: 88, column: 14, scope: !111)
!143 = !DILocation(line: 88, column: 9, scope: !111)
!144 = !DILocation(line: 90, column: 1, scope: !96)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 93, type: !16, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !15, line: 95, type: !4)
!147 = !DILocation(line: 95, column: 12, scope: !145)
!148 = !DILocation(line: 96, column: 10, scope: !145)
!149 = !DILocation(line: 100, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !151, file: !15, line: 98, column: 5)
!151 = distinct !DILexicalBlock(scope: !145, file: !15, line: 97, column: 8)
!152 = !DILocation(line: 100, column: 14, scope: !150)
!153 = !DILocation(line: 101, column: 13, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !15, line: 101, column: 13)
!155 = !DILocation(line: 101, column: 18, scope: !154)
!156 = !DILocation(line: 101, column: 13, scope: !150)
!157 = !DILocation(line: 101, column: 28, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !15, line: 101, column: 27)
!159 = !DILocalVariable(name: "source", scope: !160, file: !15, line: 104, type: !33)
!160 = distinct !DILexicalBlock(scope: !145, file: !15, line: 103, column: 5)
!161 = !DILocation(line: 104, column: 14, scope: !160)
!162 = !DILocalVariable(name: "i", scope: !160, file: !15, line: 105, type: !38)
!163 = !DILocation(line: 105, column: 16, scope: !160)
!164 = !DILocalVariable(name: "sourceLen", scope: !160, file: !15, line: 105, type: !38)
!165 = !DILocation(line: 105, column: 19, scope: !160)
!166 = !DILocation(line: 106, column: 28, scope: !160)
!167 = !DILocation(line: 106, column: 21, scope: !160)
!168 = !DILocation(line: 106, column: 19, scope: !160)
!169 = !DILocation(line: 109, column: 16, scope: !170)
!170 = distinct !DILexicalBlock(scope: !160, file: !15, line: 109, column: 9)
!171 = !DILocation(line: 109, column: 14, scope: !170)
!172 = !DILocation(line: 109, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !15, line: 109, column: 9)
!174 = !DILocation(line: 109, column: 25, scope: !173)
!175 = !DILocation(line: 109, column: 35, scope: !173)
!176 = !DILocation(line: 109, column: 23, scope: !173)
!177 = !DILocation(line: 109, column: 9, scope: !170)
!178 = !DILocation(line: 111, column: 30, scope: !179)
!179 = distinct !DILexicalBlock(scope: !173, file: !15, line: 110, column: 9)
!180 = !DILocation(line: 111, column: 23, scope: !179)
!181 = !DILocation(line: 111, column: 13, scope: !179)
!182 = !DILocation(line: 111, column: 18, scope: !179)
!183 = !DILocation(line: 111, column: 21, scope: !179)
!184 = !DILocation(line: 112, column: 9, scope: !179)
!185 = !DILocation(line: 109, column: 41, scope: !173)
!186 = !DILocation(line: 109, column: 9, scope: !173)
!187 = distinct !{!187, !177, !188, !67}
!188 = !DILocation(line: 112, column: 9, scope: !170)
!189 = !DILocation(line: 113, column: 19, scope: !160)
!190 = !DILocation(line: 113, column: 9, scope: !160)
!191 = !DILocation(line: 114, column: 14, scope: !160)
!192 = !DILocation(line: 114, column: 9, scope: !160)
!193 = !DILocation(line: 116, column: 1, scope: !145)
