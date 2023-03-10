; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_memmove_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !28
  store i8* %add.ptr, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !32
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !33
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx3, align 1, !dbg !35
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !36
  %0 = load i8*, i8** %data, align 8, !dbg !37
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %0, i64 100, i1 false), !dbg !36
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx5, align 1, !dbg !39
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @printLine(i8* %arraydecay6), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_memmove_15_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #6, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #6, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE127_Buffer_Underread__char_declare_memmove_15_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE127_Buffer_Underread__char_declare_memmove_15_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !71
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !74
  store i8* %arraydecay1, i8** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !76, metadata !DIExpression()), !dbg !78
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !79
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !80
  store i8 0, i8* %arrayidx3, align 1, !dbg !81
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %0, i64 100, i1 false), !dbg !82
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx5, align 1, !dbg !85
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  call void @printLine(i8* %arraydecay6), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !94
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !97
  store i8* %arraydecay1, i8** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !102
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !103
  store i8 0, i8* %arrayidx3, align 1, !dbg !104
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !105
  %0 = load i8*, i8** %data, align 8, !dbg !106
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay4, i8* align 1 %0, i64 100, i1 false), !dbg !105
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx5, align 1, !dbg !108
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  call void @printLine(i8* %arraydecay6), !dbg !110
  ret void, !dbg !111
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_memmove_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 5, scope: !11)
!25 = !DILocation(line: 28, column: 5, scope: !11)
!26 = !DILocation(line: 28, column: 23, scope: !11)
!27 = !DILocation(line: 33, column: 16, scope: !11)
!28 = !DILocation(line: 33, column: 27, scope: !11)
!29 = !DILocation(line: 33, column: 14, scope: !11)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !12, line: 41, type: !20)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!32 = !DILocation(line: 41, column: 14, scope: !31)
!33 = !DILocation(line: 42, column: 9, scope: !31)
!34 = !DILocation(line: 43, column: 9, scope: !31)
!35 = !DILocation(line: 43, column: 21, scope: !31)
!36 = !DILocation(line: 45, column: 9, scope: !31)
!37 = !DILocation(line: 45, column: 23, scope: !31)
!38 = !DILocation(line: 47, column: 9, scope: !31)
!39 = !DILocation(line: 47, column: 21, scope: !31)
!40 = !DILocation(line: 48, column: 19, scope: !31)
!41 = !DILocation(line: 48, column: 9, scope: !31)
!42 = !DILocation(line: 50, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_memmove_15_good", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 118, column: 5, scope: !43)
!45 = !DILocation(line: 119, column: 5, scope: !43)
!46 = !DILocation(line: 120, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 132, type: !48, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !12, line: 132, type: !50)
!53 = !DILocation(line: 132, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !12, line: 132, type: !51)
!55 = !DILocation(line: 132, column: 27, scope: !47)
!56 = !DILocation(line: 135, column: 22, scope: !47)
!57 = !DILocation(line: 135, column: 12, scope: !47)
!58 = !DILocation(line: 135, column: 5, scope: !47)
!59 = !DILocation(line: 137, column: 5, scope: !47)
!60 = !DILocation(line: 138, column: 5, scope: !47)
!61 = !DILocation(line: 139, column: 5, scope: !47)
!62 = !DILocation(line: 142, column: 5, scope: !47)
!63 = !DILocation(line: 143, column: 5, scope: !47)
!64 = !DILocation(line: 144, column: 5, scope: !47)
!65 = !DILocation(line: 146, column: 5, scope: !47)
!66 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !12, line: 59, type: !16)
!68 = !DILocation(line: 59, column: 12, scope: !66)
!69 = !DILocalVariable(name: "dataBuffer", scope: !66, file: !12, line: 60, type: !20)
!70 = !DILocation(line: 60, column: 10, scope: !66)
!71 = !DILocation(line: 61, column: 5, scope: !66)
!72 = !DILocation(line: 62, column: 5, scope: !66)
!73 = !DILocation(line: 62, column: 23, scope: !66)
!74 = !DILocation(line: 71, column: 16, scope: !66)
!75 = !DILocation(line: 71, column: 14, scope: !66)
!76 = !DILocalVariable(name: "dest", scope: !77, file: !12, line: 75, type: !20)
!77 = distinct !DILexicalBlock(scope: !66, file: !12, line: 74, column: 5)
!78 = !DILocation(line: 75, column: 14, scope: !77)
!79 = !DILocation(line: 76, column: 9, scope: !77)
!80 = !DILocation(line: 77, column: 9, scope: !77)
!81 = !DILocation(line: 77, column: 21, scope: !77)
!82 = !DILocation(line: 79, column: 9, scope: !77)
!83 = !DILocation(line: 79, column: 23, scope: !77)
!84 = !DILocation(line: 81, column: 9, scope: !77)
!85 = !DILocation(line: 81, column: 21, scope: !77)
!86 = !DILocation(line: 82, column: 19, scope: !77)
!87 = !DILocation(line: 82, column: 9, scope: !77)
!88 = !DILocation(line: 84, column: 1, scope: !66)
!89 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 89, type: !16)
!91 = !DILocation(line: 89, column: 12, scope: !89)
!92 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !12, line: 90, type: !20)
!93 = !DILocation(line: 90, column: 10, scope: !89)
!94 = !DILocation(line: 91, column: 5, scope: !89)
!95 = !DILocation(line: 92, column: 5, scope: !89)
!96 = !DILocation(line: 92, column: 23, scope: !89)
!97 = !DILocation(line: 97, column: 16, scope: !89)
!98 = !DILocation(line: 97, column: 14, scope: !89)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !12, line: 105, type: !20)
!100 = distinct !DILexicalBlock(scope: !89, file: !12, line: 104, column: 5)
!101 = !DILocation(line: 105, column: 14, scope: !100)
!102 = !DILocation(line: 106, column: 9, scope: !100)
!103 = !DILocation(line: 107, column: 9, scope: !100)
!104 = !DILocation(line: 107, column: 21, scope: !100)
!105 = !DILocation(line: 109, column: 9, scope: !100)
!106 = !DILocation(line: 109, column: 23, scope: !100)
!107 = !DILocation(line: 111, column: 9, scope: !100)
!108 = !DILocation(line: 111, column: 21, scope: !100)
!109 = !DILocation(line: 112, column: 19, scope: !100)
!110 = !DILocation(line: 112, column: 9, scope: !100)
!111 = !DILocation(line: 114, column: 1, scope: !89)
