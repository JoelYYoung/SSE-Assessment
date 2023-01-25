; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !27
  store i32* %4, i32** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !29, metadata !DIExpression()), !dbg !31
  %5 = load i32*, i32** %data, align 8, !dbg !32
  store i32* %5, i32** %dataCopy, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !33, metadata !DIExpression()), !dbg !34
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !35
  store i32* %6, i32** %data1, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %7 = bitcast [100 x i32]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 400, i1 false), !dbg !41
  %8 = load i32*, i32** %data1, align 8, !dbg !42
  %9 = bitcast i32* %8 to i8*, !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %10 = bitcast i32* %arraydecay to i8*, !dbg !43
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 400, i1 false), !dbg !43
  %11 = load i32*, i32** %data1, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 0, !dbg !44
  %12 = load i32, i32* %arrayidx, align 4, !dbg !44
  call void @printIntLine(i32 %12), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_31_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #6, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #6, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_31_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_31_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 200, align 16, !dbg !75
  %1 = bitcast i8* %0 to i32*, !dbg !76
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %2 = alloca i8, i64 400, align 16, !dbg !79
  %3 = bitcast i8* %2 to i32*, !dbg !80
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !78
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !81
  store i32* %4, i32** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !83, metadata !DIExpression()), !dbg !85
  %5 = load i32*, i32** %data, align 8, !dbg !86
  store i32* %5, i32** %dataCopy, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !87, metadata !DIExpression()), !dbg !88
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !89
  store i32* %6, i32** %data1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  %7 = bitcast [100 x i32]* %source to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 400, i1 false), !dbg !92
  %8 = load i32*, i32** %data1, align 8, !dbg !93
  %9 = bitcast i32* %8 to i8*, !dbg !94
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !94
  %10 = bitcast i32* %arraydecay to i8*, !dbg !94
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 400, i1 false), !dbg !94
  %11 = load i32*, i32** %data1, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 0, !dbg !95
  %12 = load i32, i32* %arrayidx, align 4, !dbg !95
  call void @printIntLine(i32 %12), !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_31_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_31.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 24, column: 34, scope: !13)
!22 = !DILocation(line: 24, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !4)
!24 = !DILocation(line: 25, column: 11, scope: !13)
!25 = !DILocation(line: 25, column: 35, scope: !13)
!26 = !DILocation(line: 25, column: 28, scope: !13)
!27 = !DILocation(line: 28, column: 12, scope: !13)
!28 = !DILocation(line: 28, column: 10, scope: !13)
!29 = !DILocalVariable(name: "dataCopy", scope: !30, file: !14, line: 30, type: !4)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!31 = !DILocation(line: 30, column: 15, scope: !30)
!32 = !DILocation(line: 30, column: 26, scope: !30)
!33 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 31, type: !4)
!34 = !DILocation(line: 31, column: 15, scope: !30)
!35 = !DILocation(line: 31, column: 22, scope: !30)
!36 = !DILocalVariable(name: "source", scope: !37, file: !14, line: 33, type: !38)
!37 = distinct !DILexicalBlock(scope: !30, file: !14, line: 32, column: 9)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 33, column: 17, scope: !37)
!42 = !DILocation(line: 35, column: 21, scope: !37)
!43 = !DILocation(line: 35, column: 13, scope: !37)
!44 = !DILocation(line: 36, column: 26, scope: !37)
!45 = !DILocation(line: 36, column: 13, scope: !37)
!46 = !DILocation(line: 39, column: 1, scope: !13)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_31_good", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 67, column: 5, scope: !47)
!49 = !DILocation(line: 68, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 79, type: !51, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!5, !5, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 79, type: !5)
!57 = !DILocation(line: 79, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 79, type: !53)
!59 = !DILocation(line: 79, column: 27, scope: !50)
!60 = !DILocation(line: 82, column: 22, scope: !50)
!61 = !DILocation(line: 82, column: 12, scope: !50)
!62 = !DILocation(line: 82, column: 5, scope: !50)
!63 = !DILocation(line: 84, column: 5, scope: !50)
!64 = !DILocation(line: 85, column: 5, scope: !50)
!65 = !DILocation(line: 86, column: 5, scope: !50)
!66 = !DILocation(line: 89, column: 5, scope: !50)
!67 = !DILocation(line: 90, column: 5, scope: !50)
!68 = !DILocation(line: 91, column: 5, scope: !50)
!69 = !DILocation(line: 93, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 46, type: !15, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !14, line: 48, type: !4)
!72 = !DILocation(line: 48, column: 11, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !14, line: 49, type: !4)
!74 = !DILocation(line: 49, column: 11, scope: !70)
!75 = !DILocation(line: 49, column: 34, scope: !70)
!76 = !DILocation(line: 49, column: 27, scope: !70)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !14, line: 50, type: !4)
!78 = !DILocation(line: 50, column: 11, scope: !70)
!79 = !DILocation(line: 50, column: 35, scope: !70)
!80 = !DILocation(line: 50, column: 28, scope: !70)
!81 = !DILocation(line: 52, column: 12, scope: !70)
!82 = !DILocation(line: 52, column: 10, scope: !70)
!83 = !DILocalVariable(name: "dataCopy", scope: !84, file: !14, line: 54, type: !4)
!84 = distinct !DILexicalBlock(scope: !70, file: !14, line: 53, column: 5)
!85 = !DILocation(line: 54, column: 15, scope: !84)
!86 = !DILocation(line: 54, column: 26, scope: !84)
!87 = !DILocalVariable(name: "data", scope: !84, file: !14, line: 55, type: !4)
!88 = !DILocation(line: 55, column: 15, scope: !84)
!89 = !DILocation(line: 55, column: 22, scope: !84)
!90 = !DILocalVariable(name: "source", scope: !91, file: !14, line: 57, type: !38)
!91 = distinct !DILexicalBlock(scope: !84, file: !14, line: 56, column: 9)
!92 = !DILocation(line: 57, column: 17, scope: !91)
!93 = !DILocation(line: 59, column: 21, scope: !91)
!94 = !DILocation(line: 59, column: 13, scope: !91)
!95 = !DILocation(line: 60, column: 26, scope: !91)
!96 = !DILocation(line: 60, column: 13, scope: !91)
!97 = !DILocation(line: 63, column: 1, scope: !70)
