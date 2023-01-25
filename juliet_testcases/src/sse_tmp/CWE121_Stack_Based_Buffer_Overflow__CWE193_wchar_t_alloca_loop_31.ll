; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %6 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %6, i32** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !37, metadata !DIExpression()), !dbg !38
  %7 = load i32*, i32** %dataCopy, align 8, !dbg !39
  store i32* %7, i32** %data1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31_bad.source to i8*), i64 44, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !52
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !53
  store i64 %call, i64* %sourceLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !58
  %10 = load i64, i64* %sourceLen, align 8, !dbg !60
  %add = add i64 %10, 1, !dbg !61
  %cmp = icmp ult i64 %9, %add, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %11, !dbg !66
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !66
  %13 = load i32*, i32** %data1, align 8, !dbg !67
  %14 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !67
  store i32 %12, i32* %arrayidx3, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %15, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %16 = load i32*, i32** %data1, align 8, !dbg !76
  call void @printWLine(i32* %16), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 40, align 16, !dbg !107
  %1 = bitcast i8* %0 to i32*, !dbg !108
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %2 = alloca i8, i64 44, align 16, !dbg !111
  %3 = bitcast i8* %2 to i32*, !dbg !112
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !110
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !113
  store i32* %4, i32** %data, align 8, !dbg !114
  %5 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !117, metadata !DIExpression()), !dbg !119
  %6 = load i32*, i32** %data, align 8, !dbg !120
  store i32* %6, i32** %dataCopy, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !121, metadata !DIExpression()), !dbg !122
  %7 = load i32*, i32** %dataCopy, align 8, !dbg !123
  store i32* %7, i32** %data1, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !131
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !132
  store i64 %call, i64* %sourceLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !137
  %10 = load i64, i64* %sourceLen, align 8, !dbg !139
  %add = add i64 %10, 1, !dbg !140
  %cmp = icmp ult i64 %9, %add, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %11, !dbg !145
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !145
  %13 = load i32*, i32** %data1, align 8, !dbg !146
  %14 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !146
  store i32 %12, i32* %arrayidx3, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %15, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %16 = load i32*, i32** %data1, align 8, !dbg !154
  call void @printWLine(i32* %16), !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocation(line: 31, column: 42, scope: !15)
!24 = !DILocation(line: 31, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!26 = !DILocation(line: 32, column: 15, scope: !15)
!27 = !DILocation(line: 32, column: 43, scope: !15)
!28 = !DILocation(line: 32, column: 32, scope: !15)
!29 = !DILocation(line: 35, column: 12, scope: !15)
!30 = !DILocation(line: 35, column: 10, scope: !15)
!31 = !DILocation(line: 36, column: 5, scope: !15)
!32 = !DILocation(line: 36, column: 13, scope: !15)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !16, line: 38, type: !4)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!35 = !DILocation(line: 38, column: 19, scope: !34)
!36 = !DILocation(line: 38, column: 30, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !16, line: 39, type: !4)
!38 = !DILocation(line: 39, column: 19, scope: !34)
!39 = !DILocation(line: 39, column: 26, scope: !34)
!40 = !DILocalVariable(name: "source", scope: !41, file: !16, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !16, line: 40, column: 9)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 41, column: 21, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !16, line: 42, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !48)
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 42, column: 20, scope: !41)
!50 = !DILocalVariable(name: "sourceLen", scope: !41, file: !16, line: 42, type: !47)
!51 = !DILocation(line: 42, column: 23, scope: !41)
!52 = !DILocation(line: 43, column: 32, scope: !41)
!53 = !DILocation(line: 43, column: 25, scope: !41)
!54 = !DILocation(line: 43, column: 23, scope: !41)
!55 = !DILocation(line: 46, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !41, file: !16, line: 46, column: 13)
!57 = !DILocation(line: 46, column: 18, scope: !56)
!58 = !DILocation(line: 46, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !16, line: 46, column: 13)
!60 = !DILocation(line: 46, column: 29, scope: !59)
!61 = !DILocation(line: 46, column: 39, scope: !59)
!62 = !DILocation(line: 46, column: 27, scope: !59)
!63 = !DILocation(line: 46, column: 13, scope: !56)
!64 = !DILocation(line: 48, column: 34, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !16, line: 47, column: 13)
!66 = !DILocation(line: 48, column: 27, scope: !65)
!67 = !DILocation(line: 48, column: 17, scope: !65)
!68 = !DILocation(line: 48, column: 22, scope: !65)
!69 = !DILocation(line: 48, column: 25, scope: !65)
!70 = !DILocation(line: 49, column: 13, scope: !65)
!71 = !DILocation(line: 46, column: 45, scope: !59)
!72 = !DILocation(line: 46, column: 13, scope: !59)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 49, column: 13, scope: !56)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 50, column: 24, scope: !41)
!77 = !DILocation(line: 50, column: 13, scope: !41)
!78 = !DILocation(line: 53, column: 1, scope: !15)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_31_good", scope: !16, file: !16, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 89, column: 5, scope: !79)
!81 = !DILocation(line: 90, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 101, type: !83, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!7, !7, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !16, line: 101, type: !7)
!89 = !DILocation(line: 101, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !16, line: 101, type: !85)
!91 = !DILocation(line: 101, column: 27, scope: !82)
!92 = !DILocation(line: 104, column: 22, scope: !82)
!93 = !DILocation(line: 104, column: 12, scope: !82)
!94 = !DILocation(line: 104, column: 5, scope: !82)
!95 = !DILocation(line: 106, column: 5, scope: !82)
!96 = !DILocation(line: 107, column: 5, scope: !82)
!97 = !DILocation(line: 108, column: 5, scope: !82)
!98 = !DILocation(line: 111, column: 5, scope: !82)
!99 = !DILocation(line: 112, column: 5, scope: !82)
!100 = !DILocation(line: 113, column: 5, scope: !82)
!101 = !DILocation(line: 115, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !16, line: 62, type: !4)
!104 = !DILocation(line: 62, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !16, line: 63, type: !4)
!106 = !DILocation(line: 63, column: 15, scope: !102)
!107 = !DILocation(line: 63, column: 42, scope: !102)
!108 = !DILocation(line: 63, column: 31, scope: !102)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !16, line: 64, type: !4)
!110 = !DILocation(line: 64, column: 15, scope: !102)
!111 = !DILocation(line: 64, column: 43, scope: !102)
!112 = !DILocation(line: 64, column: 32, scope: !102)
!113 = !DILocation(line: 67, column: 12, scope: !102)
!114 = !DILocation(line: 67, column: 10, scope: !102)
!115 = !DILocation(line: 68, column: 5, scope: !102)
!116 = !DILocation(line: 68, column: 13, scope: !102)
!117 = !DILocalVariable(name: "dataCopy", scope: !118, file: !16, line: 70, type: !4)
!118 = distinct !DILexicalBlock(scope: !102, file: !16, line: 69, column: 5)
!119 = !DILocation(line: 70, column: 19, scope: !118)
!120 = !DILocation(line: 70, column: 30, scope: !118)
!121 = !DILocalVariable(name: "data", scope: !118, file: !16, line: 71, type: !4)
!122 = !DILocation(line: 71, column: 19, scope: !118)
!123 = !DILocation(line: 71, column: 26, scope: !118)
!124 = !DILocalVariable(name: "source", scope: !125, file: !16, line: 73, type: !42)
!125 = distinct !DILexicalBlock(scope: !118, file: !16, line: 72, column: 9)
!126 = !DILocation(line: 73, column: 21, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !16, line: 74, type: !47)
!128 = !DILocation(line: 74, column: 20, scope: !125)
!129 = !DILocalVariable(name: "sourceLen", scope: !125, file: !16, line: 74, type: !47)
!130 = !DILocation(line: 74, column: 23, scope: !125)
!131 = !DILocation(line: 75, column: 32, scope: !125)
!132 = !DILocation(line: 75, column: 25, scope: !125)
!133 = !DILocation(line: 75, column: 23, scope: !125)
!134 = !DILocation(line: 78, column: 20, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !16, line: 78, column: 13)
!136 = !DILocation(line: 78, column: 18, scope: !135)
!137 = !DILocation(line: 78, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !16, line: 78, column: 13)
!139 = !DILocation(line: 78, column: 29, scope: !138)
!140 = !DILocation(line: 78, column: 39, scope: !138)
!141 = !DILocation(line: 78, column: 27, scope: !138)
!142 = !DILocation(line: 78, column: 13, scope: !135)
!143 = !DILocation(line: 80, column: 34, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !16, line: 79, column: 13)
!145 = !DILocation(line: 80, column: 27, scope: !144)
!146 = !DILocation(line: 80, column: 17, scope: !144)
!147 = !DILocation(line: 80, column: 22, scope: !144)
!148 = !DILocation(line: 80, column: 25, scope: !144)
!149 = !DILocation(line: 81, column: 13, scope: !144)
!150 = !DILocation(line: 78, column: 45, scope: !138)
!151 = !DILocation(line: 78, column: 13, scope: !138)
!152 = distinct !{!152, !142, !153, !75}
!153 = !DILocation(line: 81, column: 13, scope: !135)
!154 = !DILocation(line: 82, column: 24, scope: !125)
!155 = !DILocation(line: 82, column: 13, scope: !125)
!156 = !DILocation(line: 85, column: 1, scope: !102)
