; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_badSink(i32* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !24
  %1 = load i32*, i32** %data.addr, align 8, !dbg !25
  %2 = bitcast i32* %1 to i8*, !dbg !26
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !26
  %3 = bitcast i32* %arraydecay to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 40, i1 false), !dbg !26
  %4 = load i32*, i32** %data.addr, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !27
  %5 = load i32, i32* %arrayidx, align 4, !dbg !27
  call void @printIntLine(i32 %5), !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_bad() #0 !dbg !30 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !33, metadata !DIExpression()), !dbg !34
  store i32* null, i32** %data, align 8, !dbg !35
  %0 = alloca i8, i64 10, align 16, !dbg !36
  %1 = bitcast i8* %0 to i32*, !dbg !37
  store i32* %1, i32** %data, align 8, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_badSink(i32* %2), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_goodG2BSink(i32* %data) #0 !dbg !42 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !47
  %1 = load i32*, i32** %data.addr, align 8, !dbg !48
  %2 = bitcast i32* %1 to i8*, !dbg !49
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !49
  %3 = bitcast i32* %arraydecay to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 40, i1 false), !dbg !49
  %4 = load i32*, i32** %data.addr, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !50
  %5 = load i32, i32* %arrayidx, align 4, !dbg !50
  call void @printIntLine(i32 %5), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #6, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #6, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* null, i32** %data, align 8, !dbg !79
  %0 = alloca i8, i64 40, align 16, !dbg !80
  %1 = bitcast i8* %0 to i32*, !dbg !81
  store i32* %1, i32** %data, align 8, !dbg !82
  %2 = load i32*, i32** %data, align 8, !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_goodG2BSink(i32* %2), !dbg !84
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_badSink", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 21, type: !4)
!18 = !DILocation(line: 21, column: 73, scope: !13)
!19 = !DILocalVariable(name: "source", scope: !20, file: !14, line: 24, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 23, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 10)
!24 = !DILocation(line: 24, column: 13, scope: !20)
!25 = !DILocation(line: 26, column: 16, scope: !20)
!26 = !DILocation(line: 26, column: 9, scope: !20)
!27 = !DILocation(line: 27, column: 22, scope: !20)
!28 = !DILocation(line: 27, column: 9, scope: !20)
!29 = !DILocation(line: 29, column: 1, scope: !13)
!30 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_bad", scope: !14, file: !14, line: 31, type: !31, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 33, type: !4)
!34 = !DILocation(line: 33, column: 11, scope: !30)
!35 = !DILocation(line: 34, column: 10, scope: !30)
!36 = !DILocation(line: 36, column: 19, scope: !30)
!37 = !DILocation(line: 36, column: 12, scope: !30)
!38 = !DILocation(line: 36, column: 10, scope: !30)
!39 = !DILocation(line: 37, column: 66, scope: !30)
!40 = !DILocation(line: 37, column: 5, scope: !30)
!41 = !DILocation(line: 38, column: 1, scope: !30)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_goodG2BSink", scope: !14, file: !14, line: 44, type: !15, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "data", arg: 1, scope: !42, file: !14, line: 44, type: !4)
!44 = !DILocation(line: 44, column: 77, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !14, line: 47, type: !21)
!46 = distinct !DILexicalBlock(scope: !42, file: !14, line: 46, column: 5)
!47 = !DILocation(line: 47, column: 13, scope: !46)
!48 = !DILocation(line: 49, column: 16, scope: !46)
!49 = !DILocation(line: 49, column: 9, scope: !46)
!50 = !DILocation(line: 50, column: 22, scope: !46)
!51 = !DILocation(line: 50, column: 9, scope: !46)
!52 = !DILocation(line: 52, column: 1, scope: !42)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_41_good", scope: !14, file: !14, line: 64, type: !31, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 66, column: 5, scope: !53)
!55 = !DILocation(line: 67, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 79, type: !57, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!5, !5, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !14, line: 79, type: !5)
!63 = !DILocation(line: 79, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !14, line: 79, type: !59)
!65 = !DILocation(line: 79, column: 27, scope: !56)
!66 = !DILocation(line: 82, column: 22, scope: !56)
!67 = !DILocation(line: 82, column: 12, scope: !56)
!68 = !DILocation(line: 82, column: 5, scope: !56)
!69 = !DILocation(line: 84, column: 5, scope: !56)
!70 = !DILocation(line: 85, column: 5, scope: !56)
!71 = !DILocation(line: 86, column: 5, scope: !56)
!72 = !DILocation(line: 89, column: 5, scope: !56)
!73 = !DILocation(line: 90, column: 5, scope: !56)
!74 = !DILocation(line: 91, column: 5, scope: !56)
!75 = !DILocation(line: 93, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !31, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !14, line: 57, type: !4)
!78 = !DILocation(line: 57, column: 11, scope: !76)
!79 = !DILocation(line: 58, column: 10, scope: !76)
!80 = !DILocation(line: 60, column: 19, scope: !76)
!81 = !DILocation(line: 60, column: 12, scope: !76)
!82 = !DILocation(line: 60, column: 10, scope: !76)
!83 = !DILocation(line: 61, column: 70, scope: !76)
!84 = !DILocation(line: 61, column: 5, scope: !76)
!85 = !DILocation(line: 62, column: 1, scope: !76)
