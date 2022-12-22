; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_01_bad() #0 !dbg !13 {
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !30
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
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_01_good() #0 !dbg !34 {
entry:
  call void @goodG2B(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !37 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %call = call i64 @time(i64* null) #6, !dbg !47
  %conv = trunc i64 %call to i32, !dbg !48
  call void @srand(i32 %conv) #6, !dbg !49
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !50
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_01_good(), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_01_bad(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !55
  ret i32 0, !dbg !56
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !57 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !DIExpression()), !dbg !59
  store i32* null, i32** %data, align 8, !dbg !60
  %0 = alloca i8, i64 40, align 16, !dbg !61
  %1 = bitcast i8* %0 to i32*, !dbg !62
  store i32* %1, i32** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !64, metadata !DIExpression()), !dbg !66
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !66
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !66
  %3 = load i32*, i32** %data, align 8, !dbg !67
  %4 = bitcast i32* %3 to i8*, !dbg !68
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !68
  %5 = bitcast i32* %arraydecay to i8*, !dbg !68
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !68
  %6 = load i32*, i32** %data, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !69
  %7 = load i32, i32* %arrayidx, align 4, !dbg !69
  call void @printIntLine(i32 %7), !dbg !70
  ret void, !dbg !71
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_01.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_01_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_01.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocation(line: 24, column: 10, scope: !13)
!20 = !DILocation(line: 26, column: 19, scope: !13)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 10, scope: !13)
!23 = !DILocalVariable(name: "source", scope: !24, file: !14, line: 28, type: !25)
!24 = distinct !DILexicalBlock(scope: !13, file: !14, line: 27, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 28, column: 13, scope: !24)
!29 = !DILocation(line: 30, column: 17, scope: !24)
!30 = !DILocation(line: 30, column: 9, scope: !24)
!31 = !DILocation(line: 31, column: 22, scope: !24)
!32 = !DILocation(line: 31, column: 9, scope: !24)
!33 = !DILocation(line: 33, column: 1, scope: !13)
!34 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_01_good", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 56, column: 5, scope: !34)
!36 = !DILocation(line: 57, column: 1, scope: !34)
!37 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 69, type: !38, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{!5, !5, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !37, file: !14, line: 69, type: !5)
!44 = !DILocation(line: 69, column: 14, scope: !37)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !37, file: !14, line: 69, type: !40)
!46 = !DILocation(line: 69, column: 27, scope: !37)
!47 = !DILocation(line: 72, column: 22, scope: !37)
!48 = !DILocation(line: 72, column: 12, scope: !37)
!49 = !DILocation(line: 72, column: 5, scope: !37)
!50 = !DILocation(line: 74, column: 5, scope: !37)
!51 = !DILocation(line: 75, column: 5, scope: !37)
!52 = !DILocation(line: 76, column: 5, scope: !37)
!53 = !DILocation(line: 79, column: 5, scope: !37)
!54 = !DILocation(line: 80, column: 5, scope: !37)
!55 = !DILocation(line: 81, column: 5, scope: !37)
!56 = !DILocation(line: 83, column: 5, scope: !37)
!57 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 40, type: !15, scopeLine: 41, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", scope: !57, file: !14, line: 42, type: !4)
!59 = !DILocation(line: 42, column: 11, scope: !57)
!60 = !DILocation(line: 43, column: 10, scope: !57)
!61 = !DILocation(line: 45, column: 19, scope: !57)
!62 = !DILocation(line: 45, column: 12, scope: !57)
!63 = !DILocation(line: 45, column: 10, scope: !57)
!64 = !DILocalVariable(name: "source", scope: !65, file: !14, line: 47, type: !25)
!65 = distinct !DILexicalBlock(scope: !57, file: !14, line: 46, column: 5)
!66 = !DILocation(line: 47, column: 13, scope: !65)
!67 = !DILocation(line: 49, column: 17, scope: !65)
!68 = !DILocation(line: 49, column: 9, scope: !65)
!69 = !DILocation(line: 50, column: 22, scope: !65)
!70 = !DILocation(line: 50, column: 9, scope: !65)
!71 = !DILocation(line: 52, column: 1, scope: !57)
