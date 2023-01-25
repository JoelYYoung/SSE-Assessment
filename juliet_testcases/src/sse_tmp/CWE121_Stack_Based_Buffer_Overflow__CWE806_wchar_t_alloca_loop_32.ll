; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !32, metadata !DIExpression()), !dbg !34
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !35
  %4 = load i32*, i32** %3, align 8, !dbg !36
  store i32* %4, i32** %data1, align 8, !dbg !34
  %5 = load i32*, i32** %data1, align 8, !dbg !37
  %call = call i32* @wmemset(i32* %5, i32 65, i64 99) #6, !dbg !38
  %6 = load i32*, i32** %data1, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %7 = load i32*, i32** %data1, align 8, !dbg !41
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !42
  store i32* %7, i32** %8, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !44, metadata !DIExpression()), !dbg !46
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !47
  %10 = load i32*, i32** %9, align 8, !dbg !48
  store i32* %10, i32** %data2, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %11 = bitcast [50 x i32]* %dest to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 200, i1 false), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !59, metadata !DIExpression()), !dbg !60
  %12 = load i32*, i32** %data2, align 8, !dbg !61
  %call3 = call i64 @wcslen(i32* %12) #7, !dbg !62
  store i64 %call3, i64* %dataLen, align 8, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i64, i64* %i, align 8, !dbg !67
  %14 = load i64, i64* %dataLen, align 8, !dbg !69
  %cmp = icmp ult i64 %13, %14, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !72
  %16 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx4 = getelementptr inbounds i32, i32* %15, i64 %16, !dbg !72
  %17 = load i32, i32* %arrayidx4, align 4, !dbg !72
  %18 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %18, !dbg !76
  store i32 %17, i32* %arrayidx5, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %19, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !84
  store i32 0, i32* %arrayidx6, align 4, !dbg !85
  %20 = load i32*, i32** %data2, align 8, !dbg !86
  call void @printWLine(i32* %20), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #6, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #6, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !115, metadata !DIExpression()), !dbg !116
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !117, metadata !DIExpression()), !dbg !118
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 400, align 16, !dbg !121
  %1 = bitcast i8* %0 to i32*, !dbg !122
  store i32* %1, i32** %dataBuffer, align 8, !dbg !120
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !123
  store i32* %2, i32** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !125, metadata !DIExpression()), !dbg !127
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !128
  %4 = load i32*, i32** %3, align 8, !dbg !129
  store i32* %4, i32** %data1, align 8, !dbg !127
  %5 = load i32*, i32** %data1, align 8, !dbg !130
  %call = call i32* @wmemset(i32* %5, i32 65, i64 49) #6, !dbg !131
  %6 = load i32*, i32** %data1, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 49, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  %7 = load i32*, i32** %data1, align 8, !dbg !134
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !135
  store i32* %7, i32** %8, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !137, metadata !DIExpression()), !dbg !139
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !140
  %10 = load i32*, i32** %9, align 8, !dbg !141
  store i32* %10, i32** %data2, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !144
  %11 = bitcast [50 x i32]* %dest to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 200, i1 false), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !147, metadata !DIExpression()), !dbg !148
  %12 = load i32*, i32** %data2, align 8, !dbg !149
  %call3 = call i64 @wcslen(i32* %12) #7, !dbg !150
  store i64 %call3, i64* %dataLen, align 8, !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i64, i64* %i, align 8, !dbg !155
  %14 = load i64, i64* %dataLen, align 8, !dbg !157
  %cmp = icmp ult i64 %13, %14, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !160
  %16 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx4 = getelementptr inbounds i32, i32* %15, i64 %16, !dbg !160
  %17 = load i32, i32* %arrayidx4, align 4, !dbg !160
  %18 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %18, !dbg !164
  store i32 %17, i32* %arrayidx5, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %19, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !171
  store i32 0, i32* %arrayidx6, align 4, !dbg !172
  %20 = load i32*, i32** %data2, align 8, !dbg !173
  call void @printWLine(i32* %20), !dbg !174
  ret void, !dbg !175
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 28, type: !4)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 39, scope: !15)
!29 = !DILocation(line: 28, column: 28, scope: !15)
!30 = !DILocation(line: 29, column: 12, scope: !15)
!31 = !DILocation(line: 29, column: 10, scope: !15)
!32 = !DILocalVariable(name: "data", scope: !33, file: !16, line: 31, type: !4)
!33 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!34 = !DILocation(line: 31, column: 19, scope: !33)
!35 = !DILocation(line: 31, column: 27, scope: !33)
!36 = !DILocation(line: 31, column: 26, scope: !33)
!37 = !DILocation(line: 33, column: 17, scope: !33)
!38 = !DILocation(line: 33, column: 9, scope: !33)
!39 = !DILocation(line: 34, column: 9, scope: !33)
!40 = !DILocation(line: 34, column: 21, scope: !33)
!41 = !DILocation(line: 35, column: 21, scope: !33)
!42 = !DILocation(line: 35, column: 10, scope: !33)
!43 = !DILocation(line: 35, column: 19, scope: !33)
!44 = !DILocalVariable(name: "data", scope: !45, file: !16, line: 38, type: !4)
!45 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!46 = !DILocation(line: 38, column: 19, scope: !45)
!47 = !DILocation(line: 38, column: 27, scope: !45)
!48 = !DILocation(line: 38, column: 26, scope: !45)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !16, line: 40, type: !51)
!50 = distinct !DILexicalBlock(scope: !45, file: !16, line: 39, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 50)
!54 = !DILocation(line: 40, column: 21, scope: !50)
!55 = !DILocalVariable(name: "i", scope: !50, file: !16, line: 41, type: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !57)
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 41, column: 20, scope: !50)
!59 = !DILocalVariable(name: "dataLen", scope: !50, file: !16, line: 41, type: !56)
!60 = !DILocation(line: 41, column: 23, scope: !50)
!61 = !DILocation(line: 42, column: 30, scope: !50)
!62 = !DILocation(line: 42, column: 23, scope: !50)
!63 = !DILocation(line: 42, column: 21, scope: !50)
!64 = !DILocation(line: 44, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !50, file: !16, line: 44, column: 13)
!66 = !DILocation(line: 44, column: 18, scope: !65)
!67 = !DILocation(line: 44, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !16, line: 44, column: 13)
!69 = !DILocation(line: 44, column: 29, scope: !68)
!70 = !DILocation(line: 44, column: 27, scope: !68)
!71 = !DILocation(line: 44, column: 13, scope: !65)
!72 = !DILocation(line: 46, column: 27, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !16, line: 45, column: 13)
!74 = !DILocation(line: 46, column: 32, scope: !73)
!75 = !DILocation(line: 46, column: 22, scope: !73)
!76 = !DILocation(line: 46, column: 17, scope: !73)
!77 = !DILocation(line: 46, column: 25, scope: !73)
!78 = !DILocation(line: 47, column: 13, scope: !73)
!79 = !DILocation(line: 44, column: 39, scope: !68)
!80 = !DILocation(line: 44, column: 13, scope: !68)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 47, column: 13, scope: !65)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 48, column: 13, scope: !50)
!85 = !DILocation(line: 48, column: 24, scope: !50)
!86 = !DILocation(line: 49, column: 24, scope: !50)
!87 = !DILocation(line: 49, column: 13, scope: !50)
!88 = !DILocation(line: 52, column: 1, scope: !15)
!89 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_32_good", scope: !16, file: !16, line: 90, type: !17, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 92, column: 5, scope: !89)
!91 = !DILocation(line: 93, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 104, type: !93, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!7, !7, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !16, line: 104, type: !7)
!99 = !DILocation(line: 104, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !16, line: 104, type: !95)
!101 = !DILocation(line: 104, column: 27, scope: !92)
!102 = !DILocation(line: 107, column: 22, scope: !92)
!103 = !DILocation(line: 107, column: 12, scope: !92)
!104 = !DILocation(line: 107, column: 5, scope: !92)
!105 = !DILocation(line: 109, column: 5, scope: !92)
!106 = !DILocation(line: 110, column: 5, scope: !92)
!107 = !DILocation(line: 111, column: 5, scope: !92)
!108 = !DILocation(line: 114, column: 5, scope: !92)
!109 = !DILocation(line: 115, column: 5, scope: !92)
!110 = !DILocation(line: 116, column: 5, scope: !92)
!111 = !DILocation(line: 118, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !16, line: 61, type: !4)
!114 = !DILocation(line: 61, column: 15, scope: !112)
!115 = !DILocalVariable(name: "dataPtr1", scope: !112, file: !16, line: 62, type: !22)
!116 = !DILocation(line: 62, column: 16, scope: !112)
!117 = !DILocalVariable(name: "dataPtr2", scope: !112, file: !16, line: 63, type: !22)
!118 = !DILocation(line: 63, column: 16, scope: !112)
!119 = !DILocalVariable(name: "dataBuffer", scope: !112, file: !16, line: 64, type: !4)
!120 = !DILocation(line: 64, column: 15, scope: !112)
!121 = !DILocation(line: 64, column: 39, scope: !112)
!122 = !DILocation(line: 64, column: 28, scope: !112)
!123 = !DILocation(line: 65, column: 12, scope: !112)
!124 = !DILocation(line: 65, column: 10, scope: !112)
!125 = !DILocalVariable(name: "data", scope: !126, file: !16, line: 67, type: !4)
!126 = distinct !DILexicalBlock(scope: !112, file: !16, line: 66, column: 5)
!127 = !DILocation(line: 67, column: 19, scope: !126)
!128 = !DILocation(line: 67, column: 27, scope: !126)
!129 = !DILocation(line: 67, column: 26, scope: !126)
!130 = !DILocation(line: 69, column: 17, scope: !126)
!131 = !DILocation(line: 69, column: 9, scope: !126)
!132 = !DILocation(line: 70, column: 9, scope: !126)
!133 = !DILocation(line: 70, column: 20, scope: !126)
!134 = !DILocation(line: 71, column: 21, scope: !126)
!135 = !DILocation(line: 71, column: 10, scope: !126)
!136 = !DILocation(line: 71, column: 19, scope: !126)
!137 = !DILocalVariable(name: "data", scope: !138, file: !16, line: 74, type: !4)
!138 = distinct !DILexicalBlock(scope: !112, file: !16, line: 73, column: 5)
!139 = !DILocation(line: 74, column: 19, scope: !138)
!140 = !DILocation(line: 74, column: 27, scope: !138)
!141 = !DILocation(line: 74, column: 26, scope: !138)
!142 = !DILocalVariable(name: "dest", scope: !143, file: !16, line: 76, type: !51)
!143 = distinct !DILexicalBlock(scope: !138, file: !16, line: 75, column: 9)
!144 = !DILocation(line: 76, column: 21, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !143, file: !16, line: 77, type: !56)
!146 = !DILocation(line: 77, column: 20, scope: !143)
!147 = !DILocalVariable(name: "dataLen", scope: !143, file: !16, line: 77, type: !56)
!148 = !DILocation(line: 77, column: 23, scope: !143)
!149 = !DILocation(line: 78, column: 30, scope: !143)
!150 = !DILocation(line: 78, column: 23, scope: !143)
!151 = !DILocation(line: 78, column: 21, scope: !143)
!152 = !DILocation(line: 80, column: 20, scope: !153)
!153 = distinct !DILexicalBlock(scope: !143, file: !16, line: 80, column: 13)
!154 = !DILocation(line: 80, column: 18, scope: !153)
!155 = !DILocation(line: 80, column: 25, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !16, line: 80, column: 13)
!157 = !DILocation(line: 80, column: 29, scope: !156)
!158 = !DILocation(line: 80, column: 27, scope: !156)
!159 = !DILocation(line: 80, column: 13, scope: !153)
!160 = !DILocation(line: 82, column: 27, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !16, line: 81, column: 13)
!162 = !DILocation(line: 82, column: 32, scope: !161)
!163 = !DILocation(line: 82, column: 22, scope: !161)
!164 = !DILocation(line: 82, column: 17, scope: !161)
!165 = !DILocation(line: 82, column: 25, scope: !161)
!166 = !DILocation(line: 83, column: 13, scope: !161)
!167 = !DILocation(line: 80, column: 39, scope: !156)
!168 = !DILocation(line: 80, column: 13, scope: !156)
!169 = distinct !{!169, !159, !170, !83}
!170 = !DILocation(line: 83, column: 13, scope: !153)
!171 = !DILocation(line: 84, column: 13, scope: !143)
!172 = !DILocation(line: 84, column: 24, scope: !143)
!173 = !DILocation(line: 85, column: 24, scope: !143)
!174 = !DILocation(line: 85, column: 13, scope: !143)
!175 = !DILocation(line: 88, column: 1, scope: !112)
