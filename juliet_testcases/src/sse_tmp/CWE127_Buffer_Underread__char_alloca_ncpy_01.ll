; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_01.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_01_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !27
  store i8* %add.ptr, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !29, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !35
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !41
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call) #7, !dbg !42
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx5, align 1, !dbg !44
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  call void @printLine(i8* %arraydecay6), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_01_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
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
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_01_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_01_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 100, align 16, !dbg !75
  store i8* %0, i8** %dataBuffer, align 8, !dbg !74
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !77
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !80
  store i8* %3, i8** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !85
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !86
  store i8 0, i8* %arrayidx1, align 1, !dbg !87
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !88
  %4 = load i8*, i8** %data, align 8, !dbg !89
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !90
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !91
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call) #7, !dbg !92
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx5, align 1, !dbg !94
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  call void @printLine(i8* %arraydecay6), !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_01_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_01.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 30, column: 12, scope: !13)
!27 = !DILocation(line: 30, column: 23, scope: !13)
!28 = !DILocation(line: 30, column: 10, scope: !13)
!29 = !DILocalVariable(name: "dest", scope: !30, file: !14, line: 32, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 32, column: 14, scope: !30)
!35 = !DILocation(line: 33, column: 9, scope: !30)
!36 = !DILocation(line: 34, column: 9, scope: !30)
!37 = !DILocation(line: 34, column: 21, scope: !30)
!38 = !DILocation(line: 36, column: 17, scope: !30)
!39 = !DILocation(line: 36, column: 23, scope: !30)
!40 = !DILocation(line: 36, column: 36, scope: !30)
!41 = !DILocation(line: 36, column: 29, scope: !30)
!42 = !DILocation(line: 36, column: 9, scope: !30)
!43 = !DILocation(line: 38, column: 9, scope: !30)
!44 = !DILocation(line: 38, column: 21, scope: !30)
!45 = !DILocation(line: 39, column: 19, scope: !30)
!46 = !DILocation(line: 39, column: 9, scope: !30)
!47 = !DILocation(line: 41, column: 1, scope: !13)
!48 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_01_good", scope: !14, file: !14, line: 68, type: !15, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 70, column: 5, scope: !48)
!50 = !DILocation(line: 71, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 83, type: !52, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 83, type: !54)
!57 = !DILocation(line: 83, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 83, type: !55)
!59 = !DILocation(line: 83, column: 27, scope: !51)
!60 = !DILocation(line: 86, column: 22, scope: !51)
!61 = !DILocation(line: 86, column: 12, scope: !51)
!62 = !DILocation(line: 86, column: 5, scope: !51)
!63 = !DILocation(line: 88, column: 5, scope: !51)
!64 = !DILocation(line: 89, column: 5, scope: !51)
!65 = !DILocation(line: 90, column: 5, scope: !51)
!66 = !DILocation(line: 93, column: 5, scope: !51)
!67 = !DILocation(line: 94, column: 5, scope: !51)
!68 = !DILocation(line: 95, column: 5, scope: !51)
!69 = !DILocation(line: 97, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !14, line: 50, type: !4)
!72 = !DILocation(line: 50, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !14, line: 51, type: !4)
!74 = !DILocation(line: 51, column: 12, scope: !70)
!75 = !DILocation(line: 51, column: 33, scope: !70)
!76 = !DILocation(line: 52, column: 12, scope: !70)
!77 = !DILocation(line: 52, column: 5, scope: !70)
!78 = !DILocation(line: 53, column: 5, scope: !70)
!79 = !DILocation(line: 53, column: 23, scope: !70)
!80 = !DILocation(line: 55, column: 12, scope: !70)
!81 = !DILocation(line: 55, column: 10, scope: !70)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !14, line: 57, type: !31)
!83 = distinct !DILexicalBlock(scope: !70, file: !14, line: 56, column: 5)
!84 = !DILocation(line: 57, column: 14, scope: !83)
!85 = !DILocation(line: 58, column: 9, scope: !83)
!86 = !DILocation(line: 59, column: 9, scope: !83)
!87 = !DILocation(line: 59, column: 21, scope: !83)
!88 = !DILocation(line: 61, column: 17, scope: !83)
!89 = !DILocation(line: 61, column: 23, scope: !83)
!90 = !DILocation(line: 61, column: 36, scope: !83)
!91 = !DILocation(line: 61, column: 29, scope: !83)
!92 = !DILocation(line: 61, column: 9, scope: !83)
!93 = !DILocation(line: 63, column: 9, scope: !83)
!94 = !DILocation(line: 63, column: 21, scope: !83)
!95 = !DILocation(line: 64, column: 19, scope: !83)
!96 = !DILocation(line: 64, column: 9, scope: !83)
!97 = !DILocation(line: 66, column: 1, scope: !70)
