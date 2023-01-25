; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !40, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call1 = call i64 @strlen(i8* %arraydecay) #9, !dbg !43
  store i64 %call1, i64* %sourceLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !48
  %3 = load i64, i64* %sourceLen, align 8, !dbg !50
  %add = add i64 %3, 1, !dbg !51
  %cmp2 = icmp ult i64 %2, %add, !dbg !52
  br i1 %cmp2, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !56
  %5 = load i8, i8* %arrayidx, align 1, !dbg !56
  %6 = load i8*, i8** %data, align 8, !dbg !57
  %7 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !57
  store i8 %5, i8* %arrayidx3, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %8, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* %9), !dbg !67
  %10 = load i8*, i8** %data, align 8, !dbg !68
  call void @free(i8* %10) #7, !dbg !69
  ret void, !dbg !70
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #7, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #7, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i8* null, i8** %data, align 8, !dbg !97
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !98
  store i8* %call, i8** %data, align 8, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %cmp = icmp eq i8* %0, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !113
  %call1 = call i64 @strlen(i8* %arraydecay) #9, !dbg !114
  store i64 %call1, i64* %sourceLen, align 8, !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !119
  %3 = load i64, i64* %sourceLen, align 8, !dbg !121
  %add = add i64 %3, 1, !dbg !122
  %cmp2 = icmp ult i64 %2, %add, !dbg !123
  br i1 %cmp2, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !127
  %5 = load i8, i8* %arrayidx, align 1, !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  %7 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !128
  store i8 %5, i8* %arrayidx3, align 1, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %8, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* %9), !dbg !137
  %10 = load i8*, i8** %data, align 8, !dbg !138
  call void @free(i8* %10) #7, !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !142, metadata !DIExpression()), !dbg !143
  store i8* null, i8** %data, align 8, !dbg !144
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !145
  store i8* %call, i8** %data, align 8, !dbg !146
  %0 = load i8*, i8** %data, align 8, !dbg !147
  %cmp = icmp eq i8* %0, null, !dbg !149
  br i1 %cmp, label %if.then, label %if.end, !dbg !150

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !151
  unreachable, !dbg !151

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !153, metadata !DIExpression()), !dbg !155
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !155
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !155
  call void @llvm.dbg.declare(metadata i64* %i, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !158, metadata !DIExpression()), !dbg !159
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !160
  %call1 = call i64 @strlen(i8* %arraydecay) #9, !dbg !161
  store i64 %call1, i64* %sourceLen, align 8, !dbg !162
  store i64 0, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !166
  %3 = load i64, i64* %sourceLen, align 8, !dbg !168
  %add = add i64 %3, 1, !dbg !169
  %cmp2 = icmp ult i64 %2, %add, !dbg !170
  br i1 %cmp2, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !174
  %5 = load i8, i8* %arrayidx, align 1, !dbg !174
  %6 = load i8*, i8** %data, align 8, !dbg !175
  %7 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !175
  store i8 %5, i8* %arrayidx3, align 1, !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !179
  %inc = add i64 %8, 1, !dbg !179
  store i64 %inc, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !183
  call void @printLine(i8* %9), !dbg !184
  %10 = load i8*, i8** %data, align 8, !dbg !185
  call void @free(i8* %10) #7, !dbg !186
  ret void, !dbg !187
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 36, column: 24, scope: !14)
!22 = !DILocation(line: 36, column: 14, scope: !14)
!23 = !DILocation(line: 37, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 13)
!25 = !DILocation(line: 37, column: 18, scope: !24)
!26 = !DILocation(line: 37, column: 13, scope: !14)
!27 = !DILocation(line: 37, column: 28, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 37, column: 27)
!29 = !DILocalVariable(name: "source", scope: !30, file: !15, line: 45, type: !31)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 45, column: 14, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !30, file: !15, line: 46, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 46, column: 16, scope: !30)
!40 = !DILocalVariable(name: "sourceLen", scope: !30, file: !15, line: 46, type: !36)
!41 = !DILocation(line: 46, column: 19, scope: !30)
!42 = !DILocation(line: 47, column: 28, scope: !30)
!43 = !DILocation(line: 47, column: 21, scope: !30)
!44 = !DILocation(line: 47, column: 19, scope: !30)
!45 = !DILocation(line: 50, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !30, file: !15, line: 50, column: 9)
!47 = !DILocation(line: 50, column: 14, scope: !46)
!48 = !DILocation(line: 50, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !15, line: 50, column: 9)
!50 = !DILocation(line: 50, column: 25, scope: !49)
!51 = !DILocation(line: 50, column: 35, scope: !49)
!52 = !DILocation(line: 50, column: 23, scope: !49)
!53 = !DILocation(line: 50, column: 9, scope: !46)
!54 = !DILocation(line: 52, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !15, line: 51, column: 9)
!56 = !DILocation(line: 52, column: 23, scope: !55)
!57 = !DILocation(line: 52, column: 13, scope: !55)
!58 = !DILocation(line: 52, column: 18, scope: !55)
!59 = !DILocation(line: 52, column: 21, scope: !55)
!60 = !DILocation(line: 53, column: 9, scope: !55)
!61 = !DILocation(line: 50, column: 41, scope: !49)
!62 = !DILocation(line: 50, column: 9, scope: !49)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 53, column: 9, scope: !46)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 54, column: 19, scope: !30)
!67 = !DILocation(line: 54, column: 9, scope: !30)
!68 = !DILocation(line: 55, column: 14, scope: !30)
!69 = !DILocation(line: 55, column: 9, scope: !30)
!70 = !DILocation(line: 57, column: 1, scope: !14)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_15_good", scope: !15, file: !15, line: 127, type: !16, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 129, column: 5, scope: !71)
!73 = !DILocation(line: 130, column: 5, scope: !71)
!74 = !DILocation(line: 131, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 143, type: !76, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !15, line: 143, type: !78)
!81 = !DILocation(line: 143, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !15, line: 143, type: !79)
!83 = !DILocation(line: 143, column: 27, scope: !75)
!84 = !DILocation(line: 146, column: 22, scope: !75)
!85 = !DILocation(line: 146, column: 12, scope: !75)
!86 = !DILocation(line: 146, column: 5, scope: !75)
!87 = !DILocation(line: 148, column: 5, scope: !75)
!88 = !DILocation(line: 149, column: 5, scope: !75)
!89 = !DILocation(line: 150, column: 5, scope: !75)
!90 = !DILocation(line: 153, column: 5, scope: !75)
!91 = !DILocation(line: 154, column: 5, scope: !75)
!92 = !DILocation(line: 155, column: 5, scope: !75)
!93 = !DILocation(line: 157, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 64, type: !16, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 66, type: !4)
!96 = !DILocation(line: 66, column: 12, scope: !94)
!97 = !DILocation(line: 67, column: 10, scope: !94)
!98 = !DILocation(line: 76, column: 24, scope: !94)
!99 = !DILocation(line: 76, column: 14, scope: !94)
!100 = !DILocation(line: 77, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !15, line: 77, column: 13)
!102 = !DILocation(line: 77, column: 18, scope: !101)
!103 = !DILocation(line: 77, column: 13, scope: !94)
!104 = !DILocation(line: 77, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 77, column: 27)
!106 = !DILocalVariable(name: "source", scope: !107, file: !15, line: 81, type: !31)
!107 = distinct !DILexicalBlock(scope: !94, file: !15, line: 80, column: 5)
!108 = !DILocation(line: 81, column: 14, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !107, file: !15, line: 82, type: !36)
!110 = !DILocation(line: 82, column: 16, scope: !107)
!111 = !DILocalVariable(name: "sourceLen", scope: !107, file: !15, line: 82, type: !36)
!112 = !DILocation(line: 82, column: 19, scope: !107)
!113 = !DILocation(line: 83, column: 28, scope: !107)
!114 = !DILocation(line: 83, column: 21, scope: !107)
!115 = !DILocation(line: 83, column: 19, scope: !107)
!116 = !DILocation(line: 86, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !15, line: 86, column: 9)
!118 = !DILocation(line: 86, column: 14, scope: !117)
!119 = !DILocation(line: 86, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !15, line: 86, column: 9)
!121 = !DILocation(line: 86, column: 25, scope: !120)
!122 = !DILocation(line: 86, column: 35, scope: !120)
!123 = !DILocation(line: 86, column: 23, scope: !120)
!124 = !DILocation(line: 86, column: 9, scope: !117)
!125 = !DILocation(line: 88, column: 30, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !15, line: 87, column: 9)
!127 = !DILocation(line: 88, column: 23, scope: !126)
!128 = !DILocation(line: 88, column: 13, scope: !126)
!129 = !DILocation(line: 88, column: 18, scope: !126)
!130 = !DILocation(line: 88, column: 21, scope: !126)
!131 = !DILocation(line: 89, column: 9, scope: !126)
!132 = !DILocation(line: 86, column: 41, scope: !120)
!133 = !DILocation(line: 86, column: 9, scope: !120)
!134 = distinct !{!134, !124, !135, !65}
!135 = !DILocation(line: 89, column: 9, scope: !117)
!136 = !DILocation(line: 90, column: 19, scope: !107)
!137 = !DILocation(line: 90, column: 9, scope: !107)
!138 = !DILocation(line: 91, column: 14, scope: !107)
!139 = !DILocation(line: 91, column: 9, scope: !107)
!140 = !DILocation(line: 93, column: 1, scope: !94)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 96, type: !16, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !15, line: 98, type: !4)
!143 = !DILocation(line: 98, column: 12, scope: !141)
!144 = !DILocation(line: 99, column: 10, scope: !141)
!145 = !DILocation(line: 104, column: 24, scope: !141)
!146 = !DILocation(line: 104, column: 14, scope: !141)
!147 = !DILocation(line: 105, column: 13, scope: !148)
!148 = distinct !DILexicalBlock(scope: !141, file: !15, line: 105, column: 13)
!149 = !DILocation(line: 105, column: 18, scope: !148)
!150 = !DILocation(line: 105, column: 13, scope: !141)
!151 = !DILocation(line: 105, column: 28, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !15, line: 105, column: 27)
!153 = !DILocalVariable(name: "source", scope: !154, file: !15, line: 113, type: !31)
!154 = distinct !DILexicalBlock(scope: !141, file: !15, line: 112, column: 5)
!155 = !DILocation(line: 113, column: 14, scope: !154)
!156 = !DILocalVariable(name: "i", scope: !154, file: !15, line: 114, type: !36)
!157 = !DILocation(line: 114, column: 16, scope: !154)
!158 = !DILocalVariable(name: "sourceLen", scope: !154, file: !15, line: 114, type: !36)
!159 = !DILocation(line: 114, column: 19, scope: !154)
!160 = !DILocation(line: 115, column: 28, scope: !154)
!161 = !DILocation(line: 115, column: 21, scope: !154)
!162 = !DILocation(line: 115, column: 19, scope: !154)
!163 = !DILocation(line: 118, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !154, file: !15, line: 118, column: 9)
!165 = !DILocation(line: 118, column: 14, scope: !164)
!166 = !DILocation(line: 118, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !15, line: 118, column: 9)
!168 = !DILocation(line: 118, column: 25, scope: !167)
!169 = !DILocation(line: 118, column: 35, scope: !167)
!170 = !DILocation(line: 118, column: 23, scope: !167)
!171 = !DILocation(line: 118, column: 9, scope: !164)
!172 = !DILocation(line: 120, column: 30, scope: !173)
!173 = distinct !DILexicalBlock(scope: !167, file: !15, line: 119, column: 9)
!174 = !DILocation(line: 120, column: 23, scope: !173)
!175 = !DILocation(line: 120, column: 13, scope: !173)
!176 = !DILocation(line: 120, column: 18, scope: !173)
!177 = !DILocation(line: 120, column: 21, scope: !173)
!178 = !DILocation(line: 121, column: 9, scope: !173)
!179 = !DILocation(line: 118, column: 41, scope: !167)
!180 = !DILocation(line: 118, column: 9, scope: !167)
!181 = distinct !{!181, !171, !182, !65}
!182 = !DILocation(line: 121, column: 9, scope: !164)
!183 = !DILocation(line: 122, column: 19, scope: !154)
!184 = !DILocation(line: 122, column: 9, scope: !154)
!185 = !DILocation(line: 123, column: 14, scope: !154)
!186 = !DILocation(line: 123, column: 9, scope: !154)
!187 = !DILocation(line: 125, column: 1, scope: !141)
