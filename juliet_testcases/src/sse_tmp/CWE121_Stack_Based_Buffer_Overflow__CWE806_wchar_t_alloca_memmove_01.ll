; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_01_bad() #0 !dbg !15 {
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
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !28
  %4 = load i32*, i32** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !37
  %6 = bitcast i32* %arraydecay to i8*, !dbg !37
  %7 = load i32*, i32** %data, align 8, !dbg !38
  %8 = bitcast i32* %7 to i8*, !dbg !37
  %9 = load i32*, i32** %data, align 8, !dbg !39
  %call1 = call i64 @wcslen(i32* %9) #8, !dbg !40
  %mul = mul i64 %call1, 4, !dbg !41
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !37
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !43
  %10 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* %10), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_01_good() #0 !dbg !47 {
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
  %call = call i64 @time(i64* null) #7, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #7, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_01_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_01_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 400, align 16, !dbg !75
  %1 = bitcast i8* %0 to i32*, !dbg !76
  store i32* %1, i32** %dataBuffer, align 8, !dbg !74
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  store i32* %2, i32** %data, align 8, !dbg !78
  %3 = load i32*, i32** %data, align 8, !dbg !79
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !80
  %4 = load i32*, i32** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !83, metadata !DIExpression()), !dbg !85
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !85
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !86
  %6 = bitcast i32* %arraydecay to i8*, !dbg !86
  %7 = load i32*, i32** %data, align 8, !dbg !87
  %8 = bitcast i32* %7 to i8*, !dbg !86
  %9 = load i32*, i32** %data, align 8, !dbg !88
  %call1 = call i64 @wcslen(i32* %9) #8, !dbg !89
  %mul = mul i64 %call1, 4, !dbg !90
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !86
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !91
  store i32 0, i32* %arrayidx2, align 4, !dbg !92
  %10 = load i32*, i32** %data, align 8, !dbg !93
  call void @printWLine(i32* %10), !dbg !94
  ret void, !dbg !95
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_01_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_01.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 29, column: 13, scope: !15)
!28 = !DILocation(line: 29, column: 5, scope: !15)
!29 = !DILocation(line: 30, column: 5, scope: !15)
!30 = !DILocation(line: 30, column: 17, scope: !15)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !16, line: 32, type: !33)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 32, column: 17, scope: !32)
!37 = !DILocation(line: 34, column: 9, scope: !32)
!38 = !DILocation(line: 34, column: 23, scope: !32)
!39 = !DILocation(line: 34, column: 36, scope: !32)
!40 = !DILocation(line: 34, column: 29, scope: !32)
!41 = !DILocation(line: 34, column: 41, scope: !32)
!42 = !DILocation(line: 35, column: 9, scope: !32)
!43 = !DILocation(line: 35, column: 20, scope: !32)
!44 = !DILocation(line: 36, column: 20, scope: !32)
!45 = !DILocation(line: 36, column: 9, scope: !32)
!46 = !DILocation(line: 38, column: 1, scope: !15)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memmove_01_good", scope: !16, file: !16, line: 62, type: !17, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 64, column: 5, scope: !47)
!49 = !DILocation(line: 65, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 77, type: !51, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!7, !7, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !16, line: 77, type: !7)
!57 = !DILocation(line: 77, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !16, line: 77, type: !53)
!59 = !DILocation(line: 77, column: 27, scope: !50)
!60 = !DILocation(line: 80, column: 22, scope: !50)
!61 = !DILocation(line: 80, column: 12, scope: !50)
!62 = !DILocation(line: 80, column: 5, scope: !50)
!63 = !DILocation(line: 82, column: 5, scope: !50)
!64 = !DILocation(line: 83, column: 5, scope: !50)
!65 = !DILocation(line: 84, column: 5, scope: !50)
!66 = !DILocation(line: 87, column: 5, scope: !50)
!67 = !DILocation(line: 88, column: 5, scope: !50)
!68 = !DILocation(line: 89, column: 5, scope: !50)
!69 = !DILocation(line: 91, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 45, type: !17, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !16, line: 47, type: !4)
!72 = !DILocation(line: 47, column: 15, scope: !70)
!73 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !16, line: 48, type: !4)
!74 = !DILocation(line: 48, column: 15, scope: !70)
!75 = !DILocation(line: 48, column: 39, scope: !70)
!76 = !DILocation(line: 48, column: 28, scope: !70)
!77 = !DILocation(line: 49, column: 12, scope: !70)
!78 = !DILocation(line: 49, column: 10, scope: !70)
!79 = !DILocation(line: 51, column: 13, scope: !70)
!80 = !DILocation(line: 51, column: 5, scope: !70)
!81 = !DILocation(line: 52, column: 5, scope: !70)
!82 = !DILocation(line: 52, column: 16, scope: !70)
!83 = !DILocalVariable(name: "dest", scope: !84, file: !16, line: 54, type: !33)
!84 = distinct !DILexicalBlock(scope: !70, file: !16, line: 53, column: 5)
!85 = !DILocation(line: 54, column: 17, scope: !84)
!86 = !DILocation(line: 56, column: 9, scope: !84)
!87 = !DILocation(line: 56, column: 23, scope: !84)
!88 = !DILocation(line: 56, column: 36, scope: !84)
!89 = !DILocation(line: 56, column: 29, scope: !84)
!90 = !DILocation(line: 56, column: 41, scope: !84)
!91 = !DILocation(line: 57, column: 9, scope: !84)
!92 = !DILocation(line: 57, column: 20, scope: !84)
!93 = !DILocation(line: 58, column: 20, scope: !84)
!94 = !DILocation(line: 58, column: 9, scope: !84)
!95 = !DILocation(line: 60, column: 1, scope: !70)
