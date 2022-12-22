; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %0 = alloca i8, i64 10, align 16, !dbg !20
  %1 = bitcast i8* %0 to i32*, !dbg !21
  store i32* %1, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !28
  %3 = load i32*, i32** %data, align 8, !dbg !29
  %4 = bitcast i32* %3 to i8*, !dbg !30
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !30
  %5 = bitcast i32* %arraydecay to i8*, !dbg !30
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !30
  %6 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !31
  %7 = load i32, i32* %arrayidx, align 4, !dbg !31
  call void @printIntLine(i32 %7), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_15_good() #0 !dbg !34 {
entry:
  call void @goodG2B1(), !dbg !35
  call void @goodG2B2(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !38 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !44, metadata !DIExpression()), !dbg !45
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %call = call i64 @time(i64* null) #6, !dbg !48
  %conv = trunc i64 %call to i32, !dbg !49
  call void @srand(i32 %conv) #6, !dbg !50
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !51
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_15_good(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !54
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_15_bad(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !56
  ret i32 0, !dbg !57
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !58 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !59, metadata !DIExpression()), !dbg !60
  store i32* null, i32** %data, align 8, !dbg !61
  %0 = alloca i8, i64 40, align 16, !dbg !62
  %1 = bitcast i8* %0 to i32*, !dbg !63
  store i32* %1, i32** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !65, metadata !DIExpression()), !dbg !67
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !67
  %3 = load i32*, i32** %data, align 8, !dbg !68
  %4 = bitcast i32* %3 to i8*, !dbg !69
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !69
  %5 = bitcast i32* %arraydecay to i8*, !dbg !69
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !69
  %6 = load i32*, i32** %data, align 8, !dbg !70
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !70
  %7 = load i32, i32* %arrayidx, align 4, !dbg !70
  call void @printIntLine(i32 %7), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i32* null, i32** %data, align 8, !dbg !76
  %0 = alloca i8, i64 40, align 16, !dbg !77
  %1 = bitcast i8* %0 to i32*, !dbg !78
  store i32* %1, i32** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !82
  %3 = load i32*, i32** %data, align 8, !dbg !83
  %4 = bitcast i32* %3 to i8*, !dbg !84
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !84
  %5 = bitcast i32* %arraydecay to i8*, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !84
  %6 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !85
  %7 = load i32, i32* %arrayidx, align 4, !dbg !85
  call void @printIntLine(i32 %7), !dbg !86
  ret void, !dbg !87
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_15.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_15_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_15.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 29, column: 23, scope: !13)
!21 = !DILocation(line: 29, column: 16, scope: !13)
!22 = !DILocation(line: 29, column: 14, scope: !13)
!23 = !DILocalVariable(name: "source", scope: !24, file: !14, line: 37, type: !25)
!24 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 37, column: 13, scope: !24)
!29 = !DILocation(line: 39, column: 16, scope: !24)
!30 = !DILocation(line: 39, column: 9, scope: !24)
!31 = !DILocation(line: 40, column: 22, scope: !24)
!32 = !DILocation(line: 40, column: 9, scope: !24)
!33 = !DILocation(line: 42, column: 1, scope: !13)
!34 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_15_good", scope: !14, file: !14, line: 96, type: !15, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 98, column: 5, scope: !34)
!36 = !DILocation(line: 99, column: 5, scope: !34)
!37 = !DILocation(line: 100, column: 1, scope: !34)
!38 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 112, type: !39, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!5, !5, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!44 = !DILocalVariable(name: "argc", arg: 1, scope: !38, file: !14, line: 112, type: !5)
!45 = !DILocation(line: 112, column: 14, scope: !38)
!46 = !DILocalVariable(name: "argv", arg: 2, scope: !38, file: !14, line: 112, type: !41)
!47 = !DILocation(line: 112, column: 27, scope: !38)
!48 = !DILocation(line: 115, column: 22, scope: !38)
!49 = !DILocation(line: 115, column: 12, scope: !38)
!50 = !DILocation(line: 115, column: 5, scope: !38)
!51 = !DILocation(line: 117, column: 5, scope: !38)
!52 = !DILocation(line: 118, column: 5, scope: !38)
!53 = !DILocation(line: 119, column: 5, scope: !38)
!54 = !DILocation(line: 122, column: 5, scope: !38)
!55 = !DILocation(line: 123, column: 5, scope: !38)
!56 = !DILocation(line: 124, column: 5, scope: !38)
!57 = !DILocation(line: 126, column: 5, scope: !38)
!58 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", scope: !58, file: !14, line: 51, type: !4)
!60 = !DILocation(line: 51, column: 11, scope: !58)
!61 = !DILocation(line: 52, column: 10, scope: !58)
!62 = !DILocation(line: 61, column: 23, scope: !58)
!63 = !DILocation(line: 61, column: 16, scope: !58)
!64 = !DILocation(line: 61, column: 14, scope: !58)
!65 = !DILocalVariable(name: "source", scope: !66, file: !14, line: 65, type: !25)
!66 = distinct !DILexicalBlock(scope: !58, file: !14, line: 64, column: 5)
!67 = !DILocation(line: 65, column: 13, scope: !66)
!68 = !DILocation(line: 67, column: 16, scope: !66)
!69 = !DILocation(line: 67, column: 9, scope: !66)
!70 = !DILocation(line: 68, column: 22, scope: !66)
!71 = !DILocation(line: 68, column: 9, scope: !66)
!72 = !DILocation(line: 70, column: 1, scope: !58)
!73 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 75, type: !4)
!75 = !DILocation(line: 75, column: 11, scope: !73)
!76 = !DILocation(line: 76, column: 10, scope: !73)
!77 = !DILocation(line: 81, column: 23, scope: !73)
!78 = !DILocation(line: 81, column: 16, scope: !73)
!79 = !DILocation(line: 81, column: 14, scope: !73)
!80 = !DILocalVariable(name: "source", scope: !81, file: !14, line: 89, type: !25)
!81 = distinct !DILexicalBlock(scope: !73, file: !14, line: 88, column: 5)
!82 = !DILocation(line: 89, column: 13, scope: !81)
!83 = !DILocation(line: 91, column: 16, scope: !81)
!84 = !DILocation(line: 91, column: 9, scope: !81)
!85 = !DILocation(line: 92, column: 22, scope: !81)
!86 = !DILocation(line: 92, column: 9, scope: !81)
!87 = !DILocation(line: 94, column: 1, scope: !73)
