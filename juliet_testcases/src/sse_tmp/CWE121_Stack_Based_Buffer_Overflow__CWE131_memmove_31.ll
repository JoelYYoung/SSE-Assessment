; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %0 = alloca i8, i64 10, align 16, !dbg !20
  %1 = bitcast i8* %0 to i32*, !dbg !21
  store i32* %1, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !23, metadata !DIExpression()), !dbg !25
  %2 = load i32*, i32** %data, align 8, !dbg !26
  store i32* %2, i32** %dataCopy, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !27, metadata !DIExpression()), !dbg !28
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !29
  store i32* %3, i32** %data1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !35
  %5 = load i32*, i32** %data1, align 8, !dbg !36
  %6 = bitcast i32* %5 to i8*, !dbg !37
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !37
  %7 = bitcast i32* %arraydecay to i8*, !dbg !37
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !37
  %8 = load i32*, i32** %data1, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !38
  %9 = load i32, i32* %arrayidx, align 4, !dbg !38
  call void @printIntLine(i32 %9), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_31_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #6, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #6, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_31_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_31_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i32* null, i32** %data, align 8, !dbg !67
  %0 = alloca i8, i64 40, align 16, !dbg !68
  %1 = bitcast i8* %0 to i32*, !dbg !69
  store i32* %1, i32** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !71, metadata !DIExpression()), !dbg !73
  %2 = load i32*, i32** %data, align 8, !dbg !74
  store i32* %2, i32** %dataCopy, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !75, metadata !DIExpression()), !dbg !76
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !77
  store i32* %3, i32** %data1, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !78, metadata !DIExpression()), !dbg !80
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !80
  %5 = load i32*, i32** %data1, align 8, !dbg !81
  %6 = bitcast i32* %5 to i8*, !dbg !82
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !82
  %7 = bitcast i32* %arraydecay to i8*, !dbg !82
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !82
  %8 = load i32*, i32** %data1, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !83
  %9 = load i32, i32* %arrayidx, align 4, !dbg !83
  call void @printIntLine(i32 %9), !dbg !84
  ret void, !dbg !85
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_31.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_31_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_31.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 26, column: 19, scope: !13)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 10, scope: !13)
!23 = !DILocalVariable(name: "dataCopy", scope: !24, file: !14, line: 28, type: !4)
!24 = distinct !DILexicalBlock(scope: !13, file: !14, line: 27, column: 5)
!25 = !DILocation(line: 28, column: 15, scope: !24)
!26 = !DILocation(line: 28, column: 26, scope: !24)
!27 = !DILocalVariable(name: "data", scope: !24, file: !14, line: 29, type: !4)
!28 = !DILocation(line: 29, column: 15, scope: !24)
!29 = !DILocation(line: 29, column: 22, scope: !24)
!30 = !DILocalVariable(name: "source", scope: !31, file: !14, line: 31, type: !32)
!31 = distinct !DILexicalBlock(scope: !24, file: !14, line: 30, column: 9)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 10)
!35 = !DILocation(line: 31, column: 17, scope: !31)
!36 = !DILocation(line: 33, column: 21, scope: !31)
!37 = !DILocation(line: 33, column: 13, scope: !31)
!38 = !DILocation(line: 34, column: 26, scope: !31)
!39 = !DILocation(line: 34, column: 13, scope: !31)
!40 = !DILocation(line: 37, column: 1, scope: !13)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_31_good", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 64, column: 5, scope: !41)
!43 = !DILocation(line: 65, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 76, type: !45, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!5, !5, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !14, line: 76, type: !5)
!51 = !DILocation(line: 76, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !14, line: 76, type: !47)
!53 = !DILocation(line: 76, column: 27, scope: !44)
!54 = !DILocation(line: 79, column: 22, scope: !44)
!55 = !DILocation(line: 79, column: 12, scope: !44)
!56 = !DILocation(line: 79, column: 5, scope: !44)
!57 = !DILocation(line: 81, column: 5, scope: !44)
!58 = !DILocation(line: 82, column: 5, scope: !44)
!59 = !DILocation(line: 83, column: 5, scope: !44)
!60 = !DILocation(line: 86, column: 5, scope: !44)
!61 = !DILocation(line: 87, column: 5, scope: !44)
!62 = !DILocation(line: 88, column: 5, scope: !44)
!63 = !DILocation(line: 90, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 44, type: !15, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !14, line: 46, type: !4)
!66 = !DILocation(line: 46, column: 11, scope: !64)
!67 = !DILocation(line: 47, column: 10, scope: !64)
!68 = !DILocation(line: 49, column: 19, scope: !64)
!69 = !DILocation(line: 49, column: 12, scope: !64)
!70 = !DILocation(line: 49, column: 10, scope: !64)
!71 = !DILocalVariable(name: "dataCopy", scope: !72, file: !14, line: 51, type: !4)
!72 = distinct !DILexicalBlock(scope: !64, file: !14, line: 50, column: 5)
!73 = !DILocation(line: 51, column: 15, scope: !72)
!74 = !DILocation(line: 51, column: 26, scope: !72)
!75 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 52, type: !4)
!76 = !DILocation(line: 52, column: 15, scope: !72)
!77 = !DILocation(line: 52, column: 22, scope: !72)
!78 = !DILocalVariable(name: "source", scope: !79, file: !14, line: 54, type: !32)
!79 = distinct !DILexicalBlock(scope: !72, file: !14, line: 53, column: 9)
!80 = !DILocation(line: 54, column: 17, scope: !79)
!81 = !DILocation(line: 56, column: 21, scope: !79)
!82 = !DILocation(line: 56, column: 13, scope: !79)
!83 = !DILocation(line: 57, column: 26, scope: !79)
!84 = !DILocation(line: 57, column: 13, scope: !79)
!85 = !DILocation(line: 60, column: 1, scope: !64)
