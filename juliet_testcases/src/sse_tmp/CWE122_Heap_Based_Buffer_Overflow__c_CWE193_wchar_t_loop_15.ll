; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15_bad.source to i8*), i64 44, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %call1 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !45
  store i64 %call1, i64* %sourceLen, align 8, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !50
  %4 = load i64, i64* %sourceLen, align 8, !dbg !52
  %add = add i64 %4, 1, !dbg !53
  %cmp2 = icmp ult i64 %3, %add, !dbg !54
  br i1 %cmp2, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !58
  %6 = load i32, i32* %arrayidx, align 4, !dbg !58
  %7 = load i32*, i32** %data, align 8, !dbg !59
  %8 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !59
  store i32 %6, i32* %arrayidx3, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %9, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !68
  call void @printWLine(i32* %10), !dbg !69
  %11 = load i32*, i32** %data, align 8, !dbg !70
  %12 = bitcast i32* %11 to i8*, !dbg !70
  call void @free(i8* %12) #7, !dbg !71
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
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15_good() #0 !dbg !73 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32* null, i32** %data, align 8, !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !101
  %0 = bitcast i8* %call to i32*, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !103
  %1 = load i32*, i32** %data, align 8, !dbg !104
  %cmp = icmp eq i32* %1, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !117
  %call1 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !118
  store i64 %call1, i64* %sourceLen, align 8, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !123
  %4 = load i64, i64* %sourceLen, align 8, !dbg !125
  %add = add i64 %4, 1, !dbg !126
  %cmp2 = icmp ult i64 %3, %add, !dbg !127
  br i1 %cmp2, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !131
  %6 = load i32, i32* %arrayidx, align 4, !dbg !131
  %7 = load i32*, i32** %data, align 8, !dbg !132
  %8 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !132
  store i32 %6, i32* %arrayidx3, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %9, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* %10), !dbg !141
  %11 = load i32*, i32** %data, align 8, !dbg !142
  %12 = bitcast i32* %11 to i8*, !dbg !142
  call void @free(i8* %12) #7, !dbg !143
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !146, metadata !DIExpression()), !dbg !147
  store i32* null, i32** %data, align 8, !dbg !148
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !149
  %0 = bitcast i8* %call to i32*, !dbg !150
  store i32* %0, i32** %data, align 8, !dbg !151
  %1 = load i32*, i32** %data, align 8, !dbg !152
  %cmp = icmp eq i32* %1, null, !dbg !154
  br i1 %cmp, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !156
  unreachable, !dbg !156

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !158, metadata !DIExpression()), !dbg !160
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !160
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %i, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !163, metadata !DIExpression()), !dbg !164
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !165
  %call1 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !166
  store i64 %call1, i64* %sourceLen, align 8, !dbg !167
  store i64 0, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !171
  %4 = load i64, i64* %sourceLen, align 8, !dbg !173
  %add = add i64 %4, 1, !dbg !174
  %cmp2 = icmp ult i64 %3, %add, !dbg !175
  br i1 %cmp2, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !179
  %6 = load i32, i32* %arrayidx, align 4, !dbg !179
  %7 = load i32*, i32** %data, align 8, !dbg !180
  %8 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !180
  store i32 %6, i32* %arrayidx3, align 4, !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !184
  %inc = add i64 %9, 1, !dbg !184
  store i64 %inc, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !188
  call void @printWLine(i32* %10), !dbg !189
  %11 = load i32*, i32** %data, align 8, !dbg !190
  %12 = bitcast i32* %11 to i8*, !dbg !190
  call void @free(i8* %12) #7, !dbg !191
  ret void, !dbg !192
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
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 36, column: 27, scope: !16)
!24 = !DILocation(line: 36, column: 16, scope: !16)
!25 = !DILocation(line: 36, column: 14, scope: !16)
!26 = !DILocation(line: 37, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 13)
!28 = !DILocation(line: 37, column: 18, scope: !27)
!29 = !DILocation(line: 37, column: 13, scope: !16)
!30 = !DILocation(line: 37, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 37, column: 27)
!32 = !DILocalVariable(name: "source", scope: !33, file: !17, line: 45, type: !34)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 44, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 45, column: 17, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !17, line: 46, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 46, column: 16, scope: !33)
!42 = !DILocalVariable(name: "sourceLen", scope: !33, file: !17, line: 46, type: !39)
!43 = !DILocation(line: 46, column: 19, scope: !33)
!44 = !DILocation(line: 47, column: 28, scope: !33)
!45 = !DILocation(line: 47, column: 21, scope: !33)
!46 = !DILocation(line: 47, column: 19, scope: !33)
!47 = !DILocation(line: 50, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !33, file: !17, line: 50, column: 9)
!49 = !DILocation(line: 50, column: 14, scope: !48)
!50 = !DILocation(line: 50, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !17, line: 50, column: 9)
!52 = !DILocation(line: 50, column: 25, scope: !51)
!53 = !DILocation(line: 50, column: 35, scope: !51)
!54 = !DILocation(line: 50, column: 23, scope: !51)
!55 = !DILocation(line: 50, column: 9, scope: !48)
!56 = !DILocation(line: 52, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !17, line: 51, column: 9)
!58 = !DILocation(line: 52, column: 23, scope: !57)
!59 = !DILocation(line: 52, column: 13, scope: !57)
!60 = !DILocation(line: 52, column: 18, scope: !57)
!61 = !DILocation(line: 52, column: 21, scope: !57)
!62 = !DILocation(line: 53, column: 9, scope: !57)
!63 = !DILocation(line: 50, column: 41, scope: !51)
!64 = !DILocation(line: 50, column: 9, scope: !51)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 53, column: 9, scope: !48)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 54, column: 20, scope: !33)
!69 = !DILocation(line: 54, column: 9, scope: !33)
!70 = !DILocation(line: 55, column: 14, scope: !33)
!71 = !DILocation(line: 55, column: 9, scope: !33)
!72 = !DILocation(line: 57, column: 1, scope: !16)
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_15_good", scope: !17, file: !17, line: 127, type: !18, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 129, column: 5, scope: !73)
!75 = !DILocation(line: 130, column: 5, scope: !73)
!76 = !DILocation(line: 131, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 143, type: !78, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!7, !7, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !17, line: 143, type: !7)
!84 = !DILocation(line: 143, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !17, line: 143, type: !80)
!86 = !DILocation(line: 143, column: 27, scope: !77)
!87 = !DILocation(line: 146, column: 22, scope: !77)
!88 = !DILocation(line: 146, column: 12, scope: !77)
!89 = !DILocation(line: 146, column: 5, scope: !77)
!90 = !DILocation(line: 148, column: 5, scope: !77)
!91 = !DILocation(line: 149, column: 5, scope: !77)
!92 = !DILocation(line: 150, column: 5, scope: !77)
!93 = !DILocation(line: 153, column: 5, scope: !77)
!94 = !DILocation(line: 154, column: 5, scope: !77)
!95 = !DILocation(line: 155, column: 5, scope: !77)
!96 = !DILocation(line: 157, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 64, type: !18, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !17, line: 66, type: !4)
!99 = !DILocation(line: 66, column: 15, scope: !97)
!100 = !DILocation(line: 67, column: 10, scope: !97)
!101 = !DILocation(line: 76, column: 27, scope: !97)
!102 = !DILocation(line: 76, column: 16, scope: !97)
!103 = !DILocation(line: 76, column: 14, scope: !97)
!104 = !DILocation(line: 77, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !17, line: 77, column: 13)
!106 = !DILocation(line: 77, column: 18, scope: !105)
!107 = !DILocation(line: 77, column: 13, scope: !97)
!108 = !DILocation(line: 77, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !17, line: 77, column: 27)
!110 = !DILocalVariable(name: "source", scope: !111, file: !17, line: 81, type: !34)
!111 = distinct !DILexicalBlock(scope: !97, file: !17, line: 80, column: 5)
!112 = !DILocation(line: 81, column: 17, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !111, file: !17, line: 82, type: !39)
!114 = !DILocation(line: 82, column: 16, scope: !111)
!115 = !DILocalVariable(name: "sourceLen", scope: !111, file: !17, line: 82, type: !39)
!116 = !DILocation(line: 82, column: 19, scope: !111)
!117 = !DILocation(line: 83, column: 28, scope: !111)
!118 = !DILocation(line: 83, column: 21, scope: !111)
!119 = !DILocation(line: 83, column: 19, scope: !111)
!120 = !DILocation(line: 86, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !17, line: 86, column: 9)
!122 = !DILocation(line: 86, column: 14, scope: !121)
!123 = !DILocation(line: 86, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !17, line: 86, column: 9)
!125 = !DILocation(line: 86, column: 25, scope: !124)
!126 = !DILocation(line: 86, column: 35, scope: !124)
!127 = !DILocation(line: 86, column: 23, scope: !124)
!128 = !DILocation(line: 86, column: 9, scope: !121)
!129 = !DILocation(line: 88, column: 30, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !17, line: 87, column: 9)
!131 = !DILocation(line: 88, column: 23, scope: !130)
!132 = !DILocation(line: 88, column: 13, scope: !130)
!133 = !DILocation(line: 88, column: 18, scope: !130)
!134 = !DILocation(line: 88, column: 21, scope: !130)
!135 = !DILocation(line: 89, column: 9, scope: !130)
!136 = !DILocation(line: 86, column: 41, scope: !124)
!137 = !DILocation(line: 86, column: 9, scope: !124)
!138 = distinct !{!138, !128, !139, !67}
!139 = !DILocation(line: 89, column: 9, scope: !121)
!140 = !DILocation(line: 90, column: 20, scope: !111)
!141 = !DILocation(line: 90, column: 9, scope: !111)
!142 = !DILocation(line: 91, column: 14, scope: !111)
!143 = !DILocation(line: 91, column: 9, scope: !111)
!144 = !DILocation(line: 93, column: 1, scope: !97)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 96, type: !18, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !17, line: 98, type: !4)
!147 = !DILocation(line: 98, column: 15, scope: !145)
!148 = !DILocation(line: 99, column: 10, scope: !145)
!149 = !DILocation(line: 104, column: 27, scope: !145)
!150 = !DILocation(line: 104, column: 16, scope: !145)
!151 = !DILocation(line: 104, column: 14, scope: !145)
!152 = !DILocation(line: 105, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !145, file: !17, line: 105, column: 13)
!154 = !DILocation(line: 105, column: 18, scope: !153)
!155 = !DILocation(line: 105, column: 13, scope: !145)
!156 = !DILocation(line: 105, column: 28, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !17, line: 105, column: 27)
!158 = !DILocalVariable(name: "source", scope: !159, file: !17, line: 113, type: !34)
!159 = distinct !DILexicalBlock(scope: !145, file: !17, line: 112, column: 5)
!160 = !DILocation(line: 113, column: 17, scope: !159)
!161 = !DILocalVariable(name: "i", scope: !159, file: !17, line: 114, type: !39)
!162 = !DILocation(line: 114, column: 16, scope: !159)
!163 = !DILocalVariable(name: "sourceLen", scope: !159, file: !17, line: 114, type: !39)
!164 = !DILocation(line: 114, column: 19, scope: !159)
!165 = !DILocation(line: 115, column: 28, scope: !159)
!166 = !DILocation(line: 115, column: 21, scope: !159)
!167 = !DILocation(line: 115, column: 19, scope: !159)
!168 = !DILocation(line: 118, column: 16, scope: !169)
!169 = distinct !DILexicalBlock(scope: !159, file: !17, line: 118, column: 9)
!170 = !DILocation(line: 118, column: 14, scope: !169)
!171 = !DILocation(line: 118, column: 21, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !17, line: 118, column: 9)
!173 = !DILocation(line: 118, column: 25, scope: !172)
!174 = !DILocation(line: 118, column: 35, scope: !172)
!175 = !DILocation(line: 118, column: 23, scope: !172)
!176 = !DILocation(line: 118, column: 9, scope: !169)
!177 = !DILocation(line: 120, column: 30, scope: !178)
!178 = distinct !DILexicalBlock(scope: !172, file: !17, line: 119, column: 9)
!179 = !DILocation(line: 120, column: 23, scope: !178)
!180 = !DILocation(line: 120, column: 13, scope: !178)
!181 = !DILocation(line: 120, column: 18, scope: !178)
!182 = !DILocation(line: 120, column: 21, scope: !178)
!183 = !DILocation(line: 121, column: 9, scope: !178)
!184 = !DILocation(line: 118, column: 41, scope: !172)
!185 = !DILocation(line: 118, column: 9, scope: !172)
!186 = distinct !{!186, !176, !187, !67}
!187 = !DILocation(line: 121, column: 9, scope: !169)
!188 = !DILocation(line: 122, column: 20, scope: !159)
!189 = !DILocation(line: 122, column: 9, scope: !159)
!190 = !DILocation(line: 123, column: 14, scope: !159)
!191 = !DILocation(line: 123, column: 9, scope: !159)
!192 = !DILocation(line: 125, column: 1, scope: !145)
