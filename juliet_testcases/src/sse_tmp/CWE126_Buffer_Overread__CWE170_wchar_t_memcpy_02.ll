; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_02.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_02_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !15, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !32
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !35
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !35
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !35
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !35
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  call void @printWLine(i32* %arraydecay3), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_02_good() #0 !dbg !39 {
entry:
  call void @good1(), !dbg !40
  call void @good2(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #5, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #5, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_02_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_02_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !63 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !64, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !69, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !71
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !72
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !75
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !75
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !75
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !76
  store i32 0, i32* %arrayidx3, align 4, !dbg !77
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !78
  call void @printWLine(i32* %arraydecay4), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !81 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !82, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !89
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !90
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !93
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !93
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !93
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 %1, i64 396, i1 false), !dbg !93
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !94
  store i32 0, i32* %arrayidx3, align 4, !dbg !95
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !96
  call void @printWLine(i32* %arraydecay4), !dbg !97
  ret void, !dbg !98
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_02_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_02.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !16, file: !12, line: 27, type: !19)
!16 = distinct !DILexicalBlock(scope: !17, file: !12, line: 26, column: 9)
!17 = distinct !DILexicalBlock(scope: !18, file: !12, line: 25, column: 5)
!18 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 4800, elements: !23)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !22)
!21 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !{!24}
!24 = !DISubrange(count: 150)
!25 = !DILocation(line: 27, column: 21, scope: !16)
!26 = !DILocalVariable(name: "dest", scope: !16, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 32, scope: !16)
!31 = !DILocation(line: 29, column: 21, scope: !16)
!32 = !DILocation(line: 29, column: 13, scope: !16)
!33 = !DILocation(line: 30, column: 13, scope: !16)
!34 = !DILocation(line: 30, column: 23, scope: !16)
!35 = !DILocation(line: 31, column: 13, scope: !16)
!36 = !DILocation(line: 33, column: 24, scope: !16)
!37 = !DILocation(line: 33, column: 13, scope: !16)
!38 = !DILocation(line: 36, column: 1, scope: !11)
!39 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_02_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 83, column: 5, scope: !39)
!41 = !DILocation(line: 84, column: 5, scope: !39)
!42 = !DILocation(line: 85, column: 1, scope: !39)
!43 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !44, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!22, !22, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !12, line: 96, type: !22)
!50 = !DILocation(line: 96, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !12, line: 96, type: !46)
!52 = !DILocation(line: 96, column: 27, scope: !43)
!53 = !DILocation(line: 99, column: 22, scope: !43)
!54 = !DILocation(line: 99, column: 12, scope: !43)
!55 = !DILocation(line: 99, column: 5, scope: !43)
!56 = !DILocation(line: 101, column: 5, scope: !43)
!57 = !DILocation(line: 102, column: 5, scope: !43)
!58 = !DILocation(line: 103, column: 5, scope: !43)
!59 = !DILocation(line: 106, column: 5, scope: !43)
!60 = !DILocation(line: 107, column: 5, scope: !43)
!61 = !DILocation(line: 108, column: 5, scope: !43)
!62 = !DILocation(line: 110, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 43, type: !13, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 53, type: !19)
!65 = distinct !DILexicalBlock(scope: !66, file: !12, line: 52, column: 9)
!66 = distinct !DILexicalBlock(scope: !67, file: !12, line: 51, column: 5)
!67 = distinct !DILexicalBlock(scope: !63, file: !12, line: 45, column: 8)
!68 = !DILocation(line: 53, column: 21, scope: !65)
!69 = !DILocalVariable(name: "dest", scope: !65, file: !12, line: 53, type: !27)
!70 = !DILocation(line: 53, column: 32, scope: !65)
!71 = !DILocation(line: 55, column: 21, scope: !65)
!72 = !DILocation(line: 55, column: 13, scope: !65)
!73 = !DILocation(line: 56, column: 13, scope: !65)
!74 = !DILocation(line: 56, column: 23, scope: !65)
!75 = !DILocation(line: 57, column: 13, scope: !65)
!76 = !DILocation(line: 58, column: 13, scope: !65)
!77 = !DILocation(line: 58, column: 22, scope: !65)
!78 = !DILocation(line: 59, column: 24, scope: !65)
!79 = !DILocation(line: 59, column: 13, scope: !65)
!80 = !DILocation(line: 62, column: 1, scope: !63)
!81 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 70, type: !19)
!83 = distinct !DILexicalBlock(scope: !84, file: !12, line: 69, column: 9)
!84 = distinct !DILexicalBlock(scope: !85, file: !12, line: 68, column: 5)
!85 = distinct !DILexicalBlock(scope: !81, file: !12, line: 67, column: 8)
!86 = !DILocation(line: 70, column: 21, scope: !83)
!87 = !DILocalVariable(name: "dest", scope: !83, file: !12, line: 70, type: !27)
!88 = !DILocation(line: 70, column: 32, scope: !83)
!89 = !DILocation(line: 72, column: 21, scope: !83)
!90 = !DILocation(line: 72, column: 13, scope: !83)
!91 = !DILocation(line: 73, column: 13, scope: !83)
!92 = !DILocation(line: 73, column: 23, scope: !83)
!93 = !DILocation(line: 74, column: 13, scope: !83)
!94 = !DILocation(line: 75, column: 13, scope: !83)
!95 = !DILocation(line: 75, column: 22, scope: !83)
!96 = !DILocation(line: 76, column: 24, scope: !83)
!97 = !DILocation(line: 76, column: 13, scope: !83)
!98 = !DILocation(line: 79, column: 1, scope: !81)
