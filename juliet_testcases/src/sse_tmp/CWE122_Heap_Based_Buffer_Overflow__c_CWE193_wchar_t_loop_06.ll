; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06_bad.source to i8*), i64 44, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %call1 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !47
  store i64 %call1, i64* %sourceLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !52
  %4 = load i64, i64* %sourceLen, align 8, !dbg !54
  %add = add i64 %4, 1, !dbg !55
  %cmp2 = icmp ult i64 %3, %add, !dbg !56
  br i1 %cmp2, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !60
  %6 = load i32, i32* %arrayidx, align 4, !dbg !60
  %7 = load i32*, i32** %data, align 8, !dbg !61
  %8 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !61
  store i32 %6, i32* %arrayidx3, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %9, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !70
  call void @printWLine(i32* %10), !dbg !71
  %11 = load i32*, i32** %data, align 8, !dbg !72
  %12 = bitcast i32* %11 to i8*, !dbg !72
  call void @free(i8* %12) #7, !dbg !73
  ret void, !dbg !74
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #7, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #7, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32* null, i32** %data, align 8, !dbg !102
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !103
  %0 = bitcast i8* %call to i32*, !dbg !106
  store i32* %0, i32** %data, align 8, !dbg !107
  %1 = load i32*, i32** %data, align 8, !dbg !108
  %cmp = icmp eq i32* %1, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !119, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !121
  %call1 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !122
  store i64 %call1, i64* %sourceLen, align 8, !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !127
  %4 = load i64, i64* %sourceLen, align 8, !dbg !129
  %add = add i64 %4, 1, !dbg !130
  %cmp2 = icmp ult i64 %3, %add, !dbg !131
  br i1 %cmp2, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !135
  %6 = load i32, i32* %arrayidx, align 4, !dbg !135
  %7 = load i32*, i32** %data, align 8, !dbg !136
  %8 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !136
  store i32 %6, i32* %arrayidx3, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %9, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !144
  call void @printWLine(i32* %10), !dbg !145
  %11 = load i32*, i32** %data, align 8, !dbg !146
  %12 = bitcast i32* %11 to i8*, !dbg !146
  call void @free(i8* %12) #7, !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !150, metadata !DIExpression()), !dbg !151
  store i32* null, i32** %data, align 8, !dbg !152
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !153
  %0 = bitcast i8* %call to i32*, !dbg !156
  store i32* %0, i32** %data, align 8, !dbg !157
  %1 = load i32*, i32** %data, align 8, !dbg !158
  %cmp = icmp eq i32* %1, null, !dbg !160
  br i1 %cmp, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !162
  unreachable, !dbg !162

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !164, metadata !DIExpression()), !dbg !166
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !166
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !166
  call void @llvm.dbg.declare(metadata i64* %i, metadata !167, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !169, metadata !DIExpression()), !dbg !170
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !171
  %call1 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !172
  store i64 %call1, i64* %sourceLen, align 8, !dbg !173
  store i64 0, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !177
  %4 = load i64, i64* %sourceLen, align 8, !dbg !179
  %add = add i64 %4, 1, !dbg !180
  %cmp2 = icmp ult i64 %3, %add, !dbg !181
  br i1 %cmp2, label %for.body, label %for.end, !dbg !182

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !185
  %6 = load i32, i32* %arrayidx, align 4, !dbg !185
  %7 = load i32*, i32** %data, align 8, !dbg !186
  %8 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !186
  store i32 %6, i32* %arrayidx3, align 4, !dbg !188
  br label %for.inc, !dbg !189

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !190
  %inc = add i64 %9, 1, !dbg !190
  store i64 %inc, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !191, !llvm.loop !192

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !194
  call void @printWLine(i32* %10), !dbg !195
  %11 = load i32*, i32** %data, align 8, !dbg !196
  %12 = bitcast i32* %11 to i8*, !dbg !196
  call void @free(i8* %12) #7, !dbg !197
  ret void, !dbg !198
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06_bad", scope: !17, file: !17, line: 32, type: !18, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 34, type: !4)
!21 = !DILocation(line: 34, column: 15, scope: !16)
!22 = !DILocation(line: 35, column: 10, scope: !16)
!23 = !DILocation(line: 39, column: 27, scope: !24)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 37, column: 5)
!25 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 8)
!26 = !DILocation(line: 39, column: 16, scope: !24)
!27 = !DILocation(line: 39, column: 14, scope: !24)
!28 = !DILocation(line: 40, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 40, column: 13)
!30 = !DILocation(line: 40, column: 18, scope: !29)
!31 = !DILocation(line: 40, column: 13, scope: !24)
!32 = !DILocation(line: 40, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 40, column: 27)
!34 = !DILocalVariable(name: "source", scope: !35, file: !17, line: 43, type: !36)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 42, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 43, column: 17, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !17, line: 44, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 44, column: 16, scope: !35)
!44 = !DILocalVariable(name: "sourceLen", scope: !35, file: !17, line: 44, type: !41)
!45 = !DILocation(line: 44, column: 19, scope: !35)
!46 = !DILocation(line: 45, column: 28, scope: !35)
!47 = !DILocation(line: 45, column: 21, scope: !35)
!48 = !DILocation(line: 45, column: 19, scope: !35)
!49 = !DILocation(line: 48, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !35, file: !17, line: 48, column: 9)
!51 = !DILocation(line: 48, column: 14, scope: !50)
!52 = !DILocation(line: 48, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !17, line: 48, column: 9)
!54 = !DILocation(line: 48, column: 25, scope: !53)
!55 = !DILocation(line: 48, column: 35, scope: !53)
!56 = !DILocation(line: 48, column: 23, scope: !53)
!57 = !DILocation(line: 48, column: 9, scope: !50)
!58 = !DILocation(line: 50, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !17, line: 49, column: 9)
!60 = !DILocation(line: 50, column: 23, scope: !59)
!61 = !DILocation(line: 50, column: 13, scope: !59)
!62 = !DILocation(line: 50, column: 18, scope: !59)
!63 = !DILocation(line: 50, column: 21, scope: !59)
!64 = !DILocation(line: 51, column: 9, scope: !59)
!65 = !DILocation(line: 48, column: 41, scope: !53)
!66 = !DILocation(line: 48, column: 9, scope: !53)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 51, column: 9, scope: !50)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 52, column: 20, scope: !35)
!71 = !DILocation(line: 52, column: 9, scope: !35)
!72 = !DILocation(line: 53, column: 14, scope: !35)
!73 = !DILocation(line: 53, column: 9, scope: !35)
!74 = !DILocation(line: 55, column: 1, scope: !16)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_06_good", scope: !17, file: !17, line: 118, type: !18, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 120, column: 5, scope: !75)
!77 = !DILocation(line: 121, column: 5, scope: !75)
!78 = !DILocation(line: 122, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 134, type: !80, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!7, !7, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !17, line: 134, type: !7)
!86 = !DILocation(line: 134, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !17, line: 134, type: !82)
!88 = !DILocation(line: 134, column: 27, scope: !79)
!89 = !DILocation(line: 137, column: 22, scope: !79)
!90 = !DILocation(line: 137, column: 12, scope: !79)
!91 = !DILocation(line: 137, column: 5, scope: !79)
!92 = !DILocation(line: 139, column: 5, scope: !79)
!93 = !DILocation(line: 140, column: 5, scope: !79)
!94 = !DILocation(line: 141, column: 5, scope: !79)
!95 = !DILocation(line: 144, column: 5, scope: !79)
!96 = !DILocation(line: 145, column: 5, scope: !79)
!97 = !DILocation(line: 146, column: 5, scope: !79)
!98 = !DILocation(line: 148, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !17, line: 64, type: !4)
!101 = !DILocation(line: 64, column: 15, scope: !99)
!102 = !DILocation(line: 65, column: 10, scope: !99)
!103 = !DILocation(line: 74, column: 27, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !17, line: 72, column: 5)
!105 = distinct !DILexicalBlock(scope: !99, file: !17, line: 66, column: 8)
!106 = !DILocation(line: 74, column: 16, scope: !104)
!107 = !DILocation(line: 74, column: 14, scope: !104)
!108 = !DILocation(line: 75, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !17, line: 75, column: 13)
!110 = !DILocation(line: 75, column: 18, scope: !109)
!111 = !DILocation(line: 75, column: 13, scope: !104)
!112 = !DILocation(line: 75, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !17, line: 75, column: 27)
!114 = !DILocalVariable(name: "source", scope: !115, file: !17, line: 78, type: !36)
!115 = distinct !DILexicalBlock(scope: !99, file: !17, line: 77, column: 5)
!116 = !DILocation(line: 78, column: 17, scope: !115)
!117 = !DILocalVariable(name: "i", scope: !115, file: !17, line: 79, type: !41)
!118 = !DILocation(line: 79, column: 16, scope: !115)
!119 = !DILocalVariable(name: "sourceLen", scope: !115, file: !17, line: 79, type: !41)
!120 = !DILocation(line: 79, column: 19, scope: !115)
!121 = !DILocation(line: 80, column: 28, scope: !115)
!122 = !DILocation(line: 80, column: 21, scope: !115)
!123 = !DILocation(line: 80, column: 19, scope: !115)
!124 = !DILocation(line: 83, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !115, file: !17, line: 83, column: 9)
!126 = !DILocation(line: 83, column: 14, scope: !125)
!127 = !DILocation(line: 83, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !17, line: 83, column: 9)
!129 = !DILocation(line: 83, column: 25, scope: !128)
!130 = !DILocation(line: 83, column: 35, scope: !128)
!131 = !DILocation(line: 83, column: 23, scope: !128)
!132 = !DILocation(line: 83, column: 9, scope: !125)
!133 = !DILocation(line: 85, column: 30, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !17, line: 84, column: 9)
!135 = !DILocation(line: 85, column: 23, scope: !134)
!136 = !DILocation(line: 85, column: 13, scope: !134)
!137 = !DILocation(line: 85, column: 18, scope: !134)
!138 = !DILocation(line: 85, column: 21, scope: !134)
!139 = !DILocation(line: 86, column: 9, scope: !134)
!140 = !DILocation(line: 83, column: 41, scope: !128)
!141 = !DILocation(line: 83, column: 9, scope: !128)
!142 = distinct !{!142, !132, !143, !69}
!143 = !DILocation(line: 86, column: 9, scope: !125)
!144 = !DILocation(line: 87, column: 20, scope: !115)
!145 = !DILocation(line: 87, column: 9, scope: !115)
!146 = !DILocation(line: 88, column: 14, scope: !115)
!147 = !DILocation(line: 88, column: 9, scope: !115)
!148 = !DILocation(line: 90, column: 1, scope: !99)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 93, type: !18, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !17, line: 95, type: !4)
!151 = !DILocation(line: 95, column: 15, scope: !149)
!152 = !DILocation(line: 96, column: 10, scope: !149)
!153 = !DILocation(line: 100, column: 27, scope: !154)
!154 = distinct !DILexicalBlock(scope: !155, file: !17, line: 98, column: 5)
!155 = distinct !DILexicalBlock(scope: !149, file: !17, line: 97, column: 8)
!156 = !DILocation(line: 100, column: 16, scope: !154)
!157 = !DILocation(line: 100, column: 14, scope: !154)
!158 = !DILocation(line: 101, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !17, line: 101, column: 13)
!160 = !DILocation(line: 101, column: 18, scope: !159)
!161 = !DILocation(line: 101, column: 13, scope: !154)
!162 = !DILocation(line: 101, column: 28, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !17, line: 101, column: 27)
!164 = !DILocalVariable(name: "source", scope: !165, file: !17, line: 104, type: !36)
!165 = distinct !DILexicalBlock(scope: !149, file: !17, line: 103, column: 5)
!166 = !DILocation(line: 104, column: 17, scope: !165)
!167 = !DILocalVariable(name: "i", scope: !165, file: !17, line: 105, type: !41)
!168 = !DILocation(line: 105, column: 16, scope: !165)
!169 = !DILocalVariable(name: "sourceLen", scope: !165, file: !17, line: 105, type: !41)
!170 = !DILocation(line: 105, column: 19, scope: !165)
!171 = !DILocation(line: 106, column: 28, scope: !165)
!172 = !DILocation(line: 106, column: 21, scope: !165)
!173 = !DILocation(line: 106, column: 19, scope: !165)
!174 = !DILocation(line: 109, column: 16, scope: !175)
!175 = distinct !DILexicalBlock(scope: !165, file: !17, line: 109, column: 9)
!176 = !DILocation(line: 109, column: 14, scope: !175)
!177 = !DILocation(line: 109, column: 21, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !17, line: 109, column: 9)
!179 = !DILocation(line: 109, column: 25, scope: !178)
!180 = !DILocation(line: 109, column: 35, scope: !178)
!181 = !DILocation(line: 109, column: 23, scope: !178)
!182 = !DILocation(line: 109, column: 9, scope: !175)
!183 = !DILocation(line: 111, column: 30, scope: !184)
!184 = distinct !DILexicalBlock(scope: !178, file: !17, line: 110, column: 9)
!185 = !DILocation(line: 111, column: 23, scope: !184)
!186 = !DILocation(line: 111, column: 13, scope: !184)
!187 = !DILocation(line: 111, column: 18, scope: !184)
!188 = !DILocation(line: 111, column: 21, scope: !184)
!189 = !DILocation(line: 112, column: 9, scope: !184)
!190 = !DILocation(line: 109, column: 41, scope: !178)
!191 = !DILocation(line: 109, column: 9, scope: !178)
!192 = distinct !{!192, !182, !193, !69}
!193 = !DILocation(line: 112, column: 9, scope: !175)
!194 = !DILocation(line: 113, column: 20, scope: !165)
!195 = !DILocation(line: 113, column: 9, scope: !165)
!196 = !DILocation(line: 114, column: 14, scope: !165)
!197 = !DILocation(line: 114, column: 9, scope: !165)
!198 = !DILocation(line: 116, column: 1, scope: !149)
