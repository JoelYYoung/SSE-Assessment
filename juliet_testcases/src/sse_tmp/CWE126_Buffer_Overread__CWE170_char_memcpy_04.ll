; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_04.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_04_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !15, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !32
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !32
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !33
  call void @printLine(i8* %arraydecay3), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_04_good() #0 !dbg !36 {
entry:
  call void @good1(), !dbg !37
  call void @good2(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #6, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #6, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_04_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_04_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !60 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !61, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !66, metadata !DIExpression()), !dbg !67
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !68
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !71
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !71
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !71
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !72
  store i8 0, i8* %arrayidx3, align 1, !dbg !73
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !74
  call void @printLine(i8* %arraydecay4), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !77 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !78, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !85
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !88
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !88
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx3, align 1, !dbg !90
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !91
  call void @printLine(i8* %arraydecay4), !dbg !92
  ret void, !dbg !93
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_04.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_04_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_04.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !16, file: !12, line: 33, type: !19)
!16 = distinct !DILexicalBlock(scope: !17, file: !12, line: 32, column: 9)
!17 = distinct !DILexicalBlock(scope: !18, file: !12, line: 31, column: 5)
!18 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 8)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1200, elements: !21)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !{!22}
!22 = !DISubrange(count: 150)
!23 = !DILocation(line: 33, column: 18, scope: !16)
!24 = !DILocalVariable(name: "dest", scope: !16, file: !12, line: 33, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 33, column: 29, scope: !16)
!29 = !DILocation(line: 35, column: 13, scope: !16)
!30 = !DILocation(line: 36, column: 13, scope: !16)
!31 = !DILocation(line: 36, column: 23, scope: !16)
!32 = !DILocation(line: 37, column: 13, scope: !16)
!33 = !DILocation(line: 39, column: 23, scope: !16)
!34 = !DILocation(line: 39, column: 13, scope: !16)
!35 = !DILocation(line: 42, column: 1, scope: !11)
!36 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_04_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 89, column: 5, scope: !36)
!38 = !DILocation(line: 90, column: 5, scope: !36)
!39 = !DILocation(line: 91, column: 1, scope: !36)
!40 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !41, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !43, !44}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !12, line: 102, type: !43)
!47 = !DILocation(line: 102, column: 14, scope: !40)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !12, line: 102, type: !44)
!49 = !DILocation(line: 102, column: 27, scope: !40)
!50 = !DILocation(line: 105, column: 22, scope: !40)
!51 = !DILocation(line: 105, column: 12, scope: !40)
!52 = !DILocation(line: 105, column: 5, scope: !40)
!53 = !DILocation(line: 107, column: 5, scope: !40)
!54 = !DILocation(line: 108, column: 5, scope: !40)
!55 = !DILocation(line: 109, column: 5, scope: !40)
!56 = !DILocation(line: 112, column: 5, scope: !40)
!57 = !DILocation(line: 113, column: 5, scope: !40)
!58 = !DILocation(line: 114, column: 5, scope: !40)
!59 = !DILocation(line: 116, column: 5, scope: !40)
!60 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", scope: !62, file: !12, line: 59, type: !19)
!62 = distinct !DILexicalBlock(scope: !63, file: !12, line: 58, column: 9)
!63 = distinct !DILexicalBlock(scope: !64, file: !12, line: 57, column: 5)
!64 = distinct !DILexicalBlock(scope: !60, file: !12, line: 51, column: 8)
!65 = !DILocation(line: 59, column: 18, scope: !62)
!66 = !DILocalVariable(name: "dest", scope: !62, file: !12, line: 59, type: !25)
!67 = !DILocation(line: 59, column: 29, scope: !62)
!68 = !DILocation(line: 61, column: 13, scope: !62)
!69 = !DILocation(line: 62, column: 13, scope: !62)
!70 = !DILocation(line: 62, column: 23, scope: !62)
!71 = !DILocation(line: 63, column: 13, scope: !62)
!72 = !DILocation(line: 64, column: 13, scope: !62)
!73 = !DILocation(line: 64, column: 22, scope: !62)
!74 = !DILocation(line: 65, column: 23, scope: !62)
!75 = !DILocation(line: 65, column: 13, scope: !62)
!76 = !DILocation(line: 68, column: 1, scope: !60)
!77 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 76, type: !19)
!79 = distinct !DILexicalBlock(scope: !80, file: !12, line: 75, column: 9)
!80 = distinct !DILexicalBlock(scope: !81, file: !12, line: 74, column: 5)
!81 = distinct !DILexicalBlock(scope: !77, file: !12, line: 73, column: 8)
!82 = !DILocation(line: 76, column: 18, scope: !79)
!83 = !DILocalVariable(name: "dest", scope: !79, file: !12, line: 76, type: !25)
!84 = !DILocation(line: 76, column: 29, scope: !79)
!85 = !DILocation(line: 78, column: 13, scope: !79)
!86 = !DILocation(line: 79, column: 13, scope: !79)
!87 = !DILocation(line: 79, column: 23, scope: !79)
!88 = !DILocation(line: 80, column: 13, scope: !79)
!89 = !DILocation(line: 81, column: 13, scope: !79)
!90 = !DILocation(line: 81, column: 22, scope: !79)
!91 = !DILocation(line: 82, column: 23, scope: !79)
!92 = !DILocation(line: 82, column: 13, scope: !79)
!93 = !DILocation(line: 85, column: 1, scope: !77)
