; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !22
  store i32* %0, i32** %data, align 8, !dbg !23
  %1 = load i32*, i32** %data, align 8, !dbg !24
  %cmp = icmp eq i32* %1, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !35
  %3 = load i32*, i32** %data, align 8, !dbg !36
  %4 = bitcast i32* %3 to i8*, !dbg !37
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !37
  %5 = bitcast i32* %arraydecay to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !38
  %7 = load i32, i32* %arrayidx, align 4, !dbg !38
  call void @printIntLine(i32 %7), !dbg !39
  %8 = load i32*, i32** %data, align 8, !dbg !40
  %9 = bitcast i32* %8 to i8*, !dbg !40
  call void @free(i8* %9) #7, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printIntLine(i32) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_01_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #7, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #7, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_01_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_01_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i32* null, i32** %data, align 8, !dbg !69
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !70
  %0 = bitcast i8* %call to i32*, !dbg !71
  store i32* %0, i32** %data, align 8, !dbg !72
  %1 = load i32*, i32** %data, align 8, !dbg !73
  %cmp = icmp eq i32* %1, null, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !77
  unreachable, !dbg !77

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !79, metadata !DIExpression()), !dbg !81
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !81
  %3 = load i32*, i32** %data, align 8, !dbg !82
  %4 = bitcast i32* %3 to i8*, !dbg !83
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !83
  %5 = bitcast i32* %arraydecay to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !83
  %6 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !84
  %7 = load i32, i32* %arrayidx, align 4, !dbg !84
  call void @printIntLine(i32 %7), !dbg !85
  %8 = load i32*, i32** %data, align 8, !dbg !86
  %9 = bitcast i32* %8 to i8*, !dbg !86
  call void @free(i8* %9) #7, !dbg !87
  ret void, !dbg !88
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_01_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_01.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 11, scope: !14)
!20 = !DILocation(line: 24, column: 10, scope: !14)
!21 = !DILocation(line: 26, column: 19, scope: !14)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocation(line: 26, column: 10, scope: !14)
!24 = !DILocation(line: 27, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!26 = !DILocation(line: 27, column: 14, scope: !25)
!27 = !DILocation(line: 27, column: 9, scope: !14)
!28 = !DILocation(line: 27, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 27, column: 23)
!30 = !DILocalVariable(name: "source", scope: !31, file: !15, line: 29, type: !32)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 10)
!35 = !DILocation(line: 29, column: 13, scope: !31)
!36 = !DILocation(line: 31, column: 16, scope: !31)
!37 = !DILocation(line: 31, column: 9, scope: !31)
!38 = !DILocation(line: 32, column: 22, scope: !31)
!39 = !DILocation(line: 32, column: 9, scope: !31)
!40 = !DILocation(line: 33, column: 14, scope: !31)
!41 = !DILocation(line: 33, column: 9, scope: !31)
!42 = !DILocation(line: 35, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_01_good", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 60, column: 5, scope: !43)
!45 = !DILocation(line: 61, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 73, type: !47, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!5, !5, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !15, line: 73, type: !5)
!53 = !DILocation(line: 73, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !15, line: 73, type: !49)
!55 = !DILocation(line: 73, column: 27, scope: !46)
!56 = !DILocation(line: 76, column: 22, scope: !46)
!57 = !DILocation(line: 76, column: 12, scope: !46)
!58 = !DILocation(line: 76, column: 5, scope: !46)
!59 = !DILocation(line: 78, column: 5, scope: !46)
!60 = !DILocation(line: 79, column: 5, scope: !46)
!61 = !DILocation(line: 80, column: 5, scope: !46)
!62 = !DILocation(line: 83, column: 5, scope: !46)
!63 = !DILocation(line: 84, column: 5, scope: !46)
!64 = !DILocation(line: 85, column: 5, scope: !46)
!65 = !DILocation(line: 87, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 42, type: !16, scopeLine: 43, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !15, line: 44, type: !4)
!68 = !DILocation(line: 44, column: 11, scope: !66)
!69 = !DILocation(line: 45, column: 10, scope: !66)
!70 = !DILocation(line: 47, column: 19, scope: !66)
!71 = !DILocation(line: 47, column: 12, scope: !66)
!72 = !DILocation(line: 47, column: 10, scope: !66)
!73 = !DILocation(line: 48, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !66, file: !15, line: 48, column: 9)
!75 = !DILocation(line: 48, column: 14, scope: !74)
!76 = !DILocation(line: 48, column: 9, scope: !66)
!77 = !DILocation(line: 48, column: 24, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 48, column: 23)
!79 = !DILocalVariable(name: "source", scope: !80, file: !15, line: 50, type: !32)
!80 = distinct !DILexicalBlock(scope: !66, file: !15, line: 49, column: 5)
!81 = !DILocation(line: 50, column: 13, scope: !80)
!82 = !DILocation(line: 52, column: 16, scope: !80)
!83 = !DILocation(line: 52, column: 9, scope: !80)
!84 = !DILocation(line: 53, column: 22, scope: !80)
!85 = !DILocation(line: 53, column: 9, scope: !80)
!86 = !DILocation(line: 54, column: 14, scope: !80)
!87 = !DILocation(line: 54, column: 9, scope: !80)
!88 = !DILocation(line: 56, column: 1, scope: !66)
