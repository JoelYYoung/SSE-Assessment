; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  %0 = alloca i8, i64 10, align 16, !dbg !27
  %1 = bitcast i8* %0 to i32*, !dbg !28
  store i32* %1, i32** %data, align 8, !dbg !29
  %2 = load i32*, i32** %data, align 8, !dbg !30
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_unionType* %myUnion to i32**, !dbg !31
  store i32* %2, i32** %unionFirst, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !33, metadata !DIExpression()), !dbg !35
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_unionType* %myUnion to i32**, !dbg !36
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !36
  store i32* %3, i32** %data1, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !42
  %5 = load i32*, i32** %data1, align 8, !dbg !43
  %6 = bitcast i32* %5 to i8*, !dbg !44
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !44
  %7 = bitcast i32* %arraydecay to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !44
  %8 = load i32*, i32** %data1, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !45
  %9 = load i32, i32* %arrayidx, align 4, !dbg !45
  call void @printIntLine(i32 %9), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #6, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #6, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_unionType* %myUnion, metadata !74, metadata !DIExpression()), !dbg !75
  store i32* null, i32** %data, align 8, !dbg !76
  %0 = alloca i8, i64 40, align 16, !dbg !77
  %1 = bitcast i8* %0 to i32*, !dbg !78
  store i32* %1, i32** %data, align 8, !dbg !79
  %2 = load i32*, i32** %data, align 8, !dbg !80
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_unionType* %myUnion to i32**, !dbg !81
  store i32* %2, i32** %unionFirst, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !83, metadata !DIExpression()), !dbg !85
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_unionType* %myUnion to i32**, !dbg !86
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !86
  store i32* %3, i32** %data1, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !89
  %5 = load i32*, i32** %data1, align 8, !dbg !90
  %6 = bitcast i32* %5 to i8*, !dbg !91
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !91
  %7 = bitcast i32* %arraydecay to i8*, !dbg !91
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !91
  %8 = load i32*, i32** %data1, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !92
  %9 = load i32, i32* %arrayidx, align 4, !dbg !92
  call void @printIntLine(i32 %9), !dbg !93
  ret void, !dbg !94
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_bad", scope: !14, file: !14, line: 27, type: !15, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 29, type: !4)
!18 = !DILocation(line: 29, column: 11, scope: !13)
!19 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 30, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_unionType", file: !14, line: 23, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 19, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !14, line: 21, baseType: !4, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !14, line: 22, baseType: !4, size: 64)
!25 = !DILocation(line: 30, column: 68, scope: !13)
!26 = !DILocation(line: 31, column: 10, scope: !13)
!27 = !DILocation(line: 33, column: 19, scope: !13)
!28 = !DILocation(line: 33, column: 12, scope: !13)
!29 = !DILocation(line: 33, column: 10, scope: !13)
!30 = !DILocation(line: 34, column: 26, scope: !13)
!31 = !DILocation(line: 34, column: 13, scope: !13)
!32 = !DILocation(line: 34, column: 24, scope: !13)
!33 = !DILocalVariable(name: "data", scope: !34, file: !14, line: 36, type: !4)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!35 = !DILocation(line: 36, column: 15, scope: !34)
!36 = !DILocation(line: 36, column: 30, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !14, line: 38, type: !39)
!38 = distinct !DILexicalBlock(scope: !34, file: !14, line: 37, column: 9)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 10)
!42 = !DILocation(line: 38, column: 17, scope: !38)
!43 = !DILocation(line: 40, column: 20, scope: !38)
!44 = !DILocation(line: 40, column: 13, scope: !38)
!45 = !DILocation(line: 41, column: 26, scope: !38)
!46 = !DILocation(line: 41, column: 13, scope: !38)
!47 = !DILocation(line: 44, column: 1, scope: !13)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_34_good", scope: !14, file: !14, line: 70, type: !15, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 72, column: 5, scope: !48)
!50 = !DILocation(line: 73, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 84, type: !52, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!5, !5, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 84, type: !5)
!58 = !DILocation(line: 84, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 84, type: !54)
!60 = !DILocation(line: 84, column: 27, scope: !51)
!61 = !DILocation(line: 87, column: 22, scope: !51)
!62 = !DILocation(line: 87, column: 12, scope: !51)
!63 = !DILocation(line: 87, column: 5, scope: !51)
!64 = !DILocation(line: 89, column: 5, scope: !51)
!65 = !DILocation(line: 90, column: 5, scope: !51)
!66 = !DILocation(line: 91, column: 5, scope: !51)
!67 = !DILocation(line: 94, column: 5, scope: !51)
!68 = !DILocation(line: 95, column: 5, scope: !51)
!69 = !DILocation(line: 96, column: 5, scope: !51)
!70 = !DILocation(line: 98, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 53, type: !4)
!73 = !DILocation(line: 53, column: 11, scope: !71)
!74 = !DILocalVariable(name: "myUnion", scope: !71, file: !14, line: 54, type: !20)
!75 = !DILocation(line: 54, column: 68, scope: !71)
!76 = !DILocation(line: 55, column: 10, scope: !71)
!77 = !DILocation(line: 57, column: 19, scope: !71)
!78 = !DILocation(line: 57, column: 12, scope: !71)
!79 = !DILocation(line: 57, column: 10, scope: !71)
!80 = !DILocation(line: 58, column: 26, scope: !71)
!81 = !DILocation(line: 58, column: 13, scope: !71)
!82 = !DILocation(line: 58, column: 24, scope: !71)
!83 = !DILocalVariable(name: "data", scope: !84, file: !14, line: 60, type: !4)
!84 = distinct !DILexicalBlock(scope: !71, file: !14, line: 59, column: 5)
!85 = !DILocation(line: 60, column: 15, scope: !84)
!86 = !DILocation(line: 60, column: 30, scope: !84)
!87 = !DILocalVariable(name: "source", scope: !88, file: !14, line: 62, type: !39)
!88 = distinct !DILexicalBlock(scope: !84, file: !14, line: 61, column: 9)
!89 = !DILocation(line: 62, column: 17, scope: !88)
!90 = !DILocation(line: 64, column: 20, scope: !88)
!91 = !DILocation(line: 64, column: 13, scope: !88)
!92 = !DILocation(line: 65, column: 26, scope: !88)
!93 = !DILocation(line: 65, column: 13, scope: !88)
!94 = !DILocation(line: 68, column: 1, scope: !71)
