; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_61a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %0 = load i32*, i32** %data, align 8, !dbg !22
  %call = call i32* @CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b_badSource(i32* %0), !dbg !23
  store i32* %call, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !25, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !31
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !35
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !35
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %3 = bitcast i32* %2 to i8*, !dbg !35
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !37
  %call4 = call i64 @wcslen(i32* %arraydecay3) #7, !dbg !38
  %mul = mul i64 %call4, 4, !dbg !39
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !35
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx5, align 4, !dbg !41
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  call void @printWLine(i32* %arraydecay6), !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  %5 = bitcast i32* %4 to i8*, !dbg !44
  call void @free(i8* %5) #6, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_61_good() #0 !dbg !47 {
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
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_61_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_61_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  %0 = load i32*, i32** %data, align 8, !dbg !74
  %call = call i32* @CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b_goodG2BSource(i32* %0), !dbg !75
  store i32* %call, i32** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !77, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !80
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !81
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !84
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !84
  %2 = load i32*, i32** %data, align 8, !dbg !85
  %3 = bitcast i32* %2 to i8*, !dbg !84
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !86
  %call4 = call i64 @wcslen(i32* %arraydecay3) #7, !dbg !87
  %mul = mul i64 %call4, 4, !dbg !88
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !84
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx5, align 4, !dbg !90
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* %arraydecay6), !dbg !92
  %4 = load i32*, i32** %data, align 8, !dbg !93
  %5 = bitcast i32* %4 to i8*, !dbg !93
  call void @free(i8* %5) #6, !dbg !94
  ret void, !dbg !95
}

declare dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_memmove_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !11)
!21 = !DILocation(line: 29, column: 10, scope: !11)
!22 = !DILocation(line: 30, column: 73, scope: !11)
!23 = !DILocation(line: 30, column: 12, scope: !11)
!24 = !DILocation(line: 30, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dest", scope: !26, file: !12, line: 32, type: !27)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 32, column: 17, scope: !26)
!31 = !DILocation(line: 33, column: 17, scope: !26)
!32 = !DILocation(line: 33, column: 9, scope: !26)
!33 = !DILocation(line: 34, column: 9, scope: !26)
!34 = !DILocation(line: 34, column: 21, scope: !26)
!35 = !DILocation(line: 37, column: 9, scope: !26)
!36 = !DILocation(line: 37, column: 23, scope: !26)
!37 = !DILocation(line: 37, column: 36, scope: !26)
!38 = !DILocation(line: 37, column: 29, scope: !26)
!39 = !DILocation(line: 37, column: 41, scope: !26)
!40 = !DILocation(line: 38, column: 9, scope: !26)
!41 = !DILocation(line: 38, column: 21, scope: !26)
!42 = !DILocation(line: 39, column: 20, scope: !26)
!43 = !DILocation(line: 39, column: 9, scope: !26)
!44 = !DILocation(line: 40, column: 14, scope: !26)
!45 = !DILocation(line: 40, column: 9, scope: !26)
!46 = !DILocation(line: 42, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_61_good", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 71, column: 5, scope: !47)
!49 = !DILocation(line: 72, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 84, type: !51, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!19, !19, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 84, type: !19)
!57 = !DILocation(line: 84, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 84, type: !53)
!59 = !DILocation(line: 84, column: 27, scope: !50)
!60 = !DILocation(line: 87, column: 22, scope: !50)
!61 = !DILocation(line: 87, column: 12, scope: !50)
!62 = !DILocation(line: 87, column: 5, scope: !50)
!63 = !DILocation(line: 89, column: 5, scope: !50)
!64 = !DILocation(line: 90, column: 5, scope: !50)
!65 = !DILocation(line: 91, column: 5, scope: !50)
!66 = !DILocation(line: 94, column: 5, scope: !50)
!67 = !DILocation(line: 95, column: 5, scope: !50)
!68 = !DILocation(line: 96, column: 5, scope: !50)
!69 = !DILocation(line: 98, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 53, type: !16)
!72 = !DILocation(line: 53, column: 15, scope: !70)
!73 = !DILocation(line: 54, column: 10, scope: !70)
!74 = !DILocation(line: 55, column: 77, scope: !70)
!75 = !DILocation(line: 55, column: 12, scope: !70)
!76 = !DILocation(line: 55, column: 10, scope: !70)
!77 = !DILocalVariable(name: "dest", scope: !78, file: !12, line: 57, type: !27)
!78 = distinct !DILexicalBlock(scope: !70, file: !12, line: 56, column: 5)
!79 = !DILocation(line: 57, column: 17, scope: !78)
!80 = !DILocation(line: 58, column: 17, scope: !78)
!81 = !DILocation(line: 58, column: 9, scope: !78)
!82 = !DILocation(line: 59, column: 9, scope: !78)
!83 = !DILocation(line: 59, column: 21, scope: !78)
!84 = !DILocation(line: 62, column: 9, scope: !78)
!85 = !DILocation(line: 62, column: 23, scope: !78)
!86 = !DILocation(line: 62, column: 36, scope: !78)
!87 = !DILocation(line: 62, column: 29, scope: !78)
!88 = !DILocation(line: 62, column: 41, scope: !78)
!89 = !DILocation(line: 63, column: 9, scope: !78)
!90 = !DILocation(line: 63, column: 21, scope: !78)
!91 = !DILocation(line: 64, column: 20, scope: !78)
!92 = !DILocation(line: 64, column: 9, scope: !78)
!93 = !DILocation(line: 65, column: 14, scope: !78)
!94 = !DILocation(line: 65, column: 9, scope: !78)
!95 = !DILocation(line: 67, column: 1, scope: !70)
