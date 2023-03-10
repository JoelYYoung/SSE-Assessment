; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61b_badSource(i32* %3), !dbg !28
  store i32* %call, i32** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %5) #5, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  call void @printWLine(i32* %6), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61b_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = alloca i8, i64 400, align 16, !dbg !70
  %1 = bitcast i8* %0 to i32*, !dbg !71
  store i32* %1, i32** %dataBuffer, align 8, !dbg !69
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !72
  store i32* %2, i32** %data, align 8, !dbg !73
  %3 = load i32*, i32** %data, align 8, !dbg !74
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61b_goodG2BSource(i32* %3), !dbg !75
  store i32* %call, i32** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !77, metadata !DIExpression()), !dbg !79
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !79
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !80
  %5 = load i32*, i32** %data, align 8, !dbg !81
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %5) #5, !dbg !82
  %6 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* %6), !dbg !84
  ret void, !dbg !85
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 29, type: !4)
!22 = !DILocation(line: 29, column: 15, scope: !15)
!23 = !DILocation(line: 29, column: 39, scope: !15)
!24 = !DILocation(line: 29, column: 28, scope: !15)
!25 = !DILocation(line: 30, column: 12, scope: !15)
!26 = !DILocation(line: 30, column: 10, scope: !15)
!27 = !DILocation(line: 31, column: 85, scope: !15)
!28 = !DILocation(line: 31, column: 12, scope: !15)
!29 = !DILocation(line: 31, column: 10, scope: !15)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 33, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 33, column: 17, scope: !31)
!36 = !DILocation(line: 35, column: 16, scope: !31)
!37 = !DILocation(line: 35, column: 22, scope: !31)
!38 = !DILocation(line: 35, column: 9, scope: !31)
!39 = !DILocation(line: 36, column: 20, scope: !31)
!40 = !DILocation(line: 36, column: 9, scope: !31)
!41 = !DILocation(line: 38, column: 1, scope: !15)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_61_good", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 63, column: 5, scope: !42)
!44 = !DILocation(line: 64, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 76, type: !46, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!7, !7, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !16, line: 76, type: !7)
!52 = !DILocation(line: 76, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !16, line: 76, type: !48)
!54 = !DILocation(line: 76, column: 27, scope: !45)
!55 = !DILocation(line: 79, column: 22, scope: !45)
!56 = !DILocation(line: 79, column: 12, scope: !45)
!57 = !DILocation(line: 79, column: 5, scope: !45)
!58 = !DILocation(line: 81, column: 5, scope: !45)
!59 = !DILocation(line: 82, column: 5, scope: !45)
!60 = !DILocation(line: 83, column: 5, scope: !45)
!61 = !DILocation(line: 86, column: 5, scope: !45)
!62 = !DILocation(line: 87, column: 5, scope: !45)
!63 = !DILocation(line: 88, column: 5, scope: !45)
!64 = !DILocation(line: 90, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !16, line: 49, type: !4)
!67 = !DILocation(line: 49, column: 15, scope: !65)
!68 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !16, line: 50, type: !4)
!69 = !DILocation(line: 50, column: 15, scope: !65)
!70 = !DILocation(line: 50, column: 39, scope: !65)
!71 = !DILocation(line: 50, column: 28, scope: !65)
!72 = !DILocation(line: 51, column: 12, scope: !65)
!73 = !DILocation(line: 51, column: 10, scope: !65)
!74 = !DILocation(line: 52, column: 89, scope: !65)
!75 = !DILocation(line: 52, column: 12, scope: !65)
!76 = !DILocation(line: 52, column: 10, scope: !65)
!77 = !DILocalVariable(name: "dest", scope: !78, file: !16, line: 54, type: !32)
!78 = distinct !DILexicalBlock(scope: !65, file: !16, line: 53, column: 5)
!79 = !DILocation(line: 54, column: 17, scope: !78)
!80 = !DILocation(line: 56, column: 16, scope: !78)
!81 = !DILocation(line: 56, column: 22, scope: !78)
!82 = !DILocation(line: 56, column: 9, scope: !78)
!83 = !DILocation(line: 57, column: 20, scope: !78)
!84 = !DILocation(line: 57, column: 9, scope: !78)
!85 = !DILocation(line: 59, column: 1, scope: !65)
