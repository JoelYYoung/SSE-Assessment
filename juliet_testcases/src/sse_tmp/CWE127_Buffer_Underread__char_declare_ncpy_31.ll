; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
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
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %0, i8** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !34, metadata !DIExpression()), !dbg !35
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !36
  store i8* %1, i8** %data2, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !39
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx4, align 1, !dbg !42
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  %2 = load i8*, i8** %data2, align 8, !dbg !44
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !46
  %call7 = call i8* @strncpy(i8* %arraydecay5, i8* %2, i64 %call) #7, !dbg !47
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx8, align 1, !dbg !49
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @printLine(i8* %arraydecay9), !dbg !51
  ret void, !dbg !52
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
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_31_good() #0 !dbg !53 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #7, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #7, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE127_Buffer_Underread__char_declare_ncpy_31_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__char_declare_ncpy_31_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !80
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !83
  store i8* %arraydecay1, i8** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !85, metadata !DIExpression()), !dbg !87
  %0 = load i8*, i8** %data, align 8, !dbg !88
  store i8* %0, i8** %dataCopy, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !89, metadata !DIExpression()), !dbg !90
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !91
  store i8* %1, i8** %data2, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !95
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx4, align 1, !dbg !97
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  %2 = load i8*, i8** %data2, align 8, !dbg !99
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !100
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !101
  %call7 = call i8* @strncpy(i8* %arraydecay5, i8* %2, i64 %call) #7, !dbg !102
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !103
  store i8 0, i8* %arrayidx8, align 1, !dbg !104
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !105
  call void @printLine(i8* %arraydecay9), !dbg !106
  ret void, !dbg !107
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!27 = !DILocation(line: 30, column: 12, scope: !11)
!28 = !DILocation(line: 30, column: 23, scope: !11)
!29 = !DILocation(line: 30, column: 10, scope: !11)
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !12, line: 32, type: !16)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!32 = !DILocation(line: 32, column: 16, scope: !31)
!33 = !DILocation(line: 32, column: 27, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !12, line: 33, type: !16)
!35 = !DILocation(line: 33, column: 16, scope: !31)
!36 = !DILocation(line: 33, column: 23, scope: !31)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 35, type: !20)
!38 = distinct !DILexicalBlock(scope: !31, file: !12, line: 34, column: 9)
!39 = !DILocation(line: 35, column: 18, scope: !38)
!40 = !DILocation(line: 36, column: 13, scope: !38)
!41 = !DILocation(line: 37, column: 13, scope: !38)
!42 = !DILocation(line: 37, column: 25, scope: !38)
!43 = !DILocation(line: 39, column: 21, scope: !38)
!44 = !DILocation(line: 39, column: 27, scope: !38)
!45 = !DILocation(line: 39, column: 40, scope: !38)
!46 = !DILocation(line: 39, column: 33, scope: !38)
!47 = !DILocation(line: 39, column: 13, scope: !38)
!48 = !DILocation(line: 41, column: 13, scope: !38)
!49 = !DILocation(line: 41, column: 25, scope: !38)
!50 = !DILocation(line: 42, column: 23, scope: !38)
!51 = !DILocation(line: 42, column: 13, scope: !38)
!52 = !DILocation(line: 45, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_31_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 78, column: 5, scope: !53)
!55 = !DILocation(line: 79, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !57, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 90, type: !59)
!62 = !DILocation(line: 90, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 90, type: !60)
!64 = !DILocation(line: 90, column: 27, scope: !56)
!65 = !DILocation(line: 93, column: 22, scope: !56)
!66 = !DILocation(line: 93, column: 12, scope: !56)
!67 = !DILocation(line: 93, column: 5, scope: !56)
!68 = !DILocation(line: 95, column: 5, scope: !56)
!69 = !DILocation(line: 96, column: 5, scope: !56)
!70 = !DILocation(line: 97, column: 5, scope: !56)
!71 = !DILocation(line: 100, column: 5, scope: !56)
!72 = !DILocation(line: 101, column: 5, scope: !56)
!73 = !DILocation(line: 102, column: 5, scope: !56)
!74 = !DILocation(line: 104, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 54, type: !16)
!77 = !DILocation(line: 54, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !12, line: 55, type: !20)
!79 = !DILocation(line: 55, column: 10, scope: !75)
!80 = !DILocation(line: 56, column: 5, scope: !75)
!81 = !DILocation(line: 57, column: 5, scope: !75)
!82 = !DILocation(line: 57, column: 23, scope: !75)
!83 = !DILocation(line: 59, column: 12, scope: !75)
!84 = !DILocation(line: 59, column: 10, scope: !75)
!85 = !DILocalVariable(name: "dataCopy", scope: !86, file: !12, line: 61, type: !16)
!86 = distinct !DILexicalBlock(scope: !75, file: !12, line: 60, column: 5)
!87 = !DILocation(line: 61, column: 16, scope: !86)
!88 = !DILocation(line: 61, column: 27, scope: !86)
!89 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 62, type: !16)
!90 = !DILocation(line: 62, column: 16, scope: !86)
!91 = !DILocation(line: 62, column: 23, scope: !86)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !12, line: 64, type: !20)
!93 = distinct !DILexicalBlock(scope: !86, file: !12, line: 63, column: 9)
!94 = !DILocation(line: 64, column: 18, scope: !93)
!95 = !DILocation(line: 65, column: 13, scope: !93)
!96 = !DILocation(line: 66, column: 13, scope: !93)
!97 = !DILocation(line: 66, column: 25, scope: !93)
!98 = !DILocation(line: 68, column: 21, scope: !93)
!99 = !DILocation(line: 68, column: 27, scope: !93)
!100 = !DILocation(line: 68, column: 40, scope: !93)
!101 = !DILocation(line: 68, column: 33, scope: !93)
!102 = !DILocation(line: 68, column: 13, scope: !93)
!103 = !DILocation(line: 70, column: 13, scope: !93)
!104 = !DILocation(line: 70, column: 25, scope: !93)
!105 = !DILocation(line: 71, column: 23, scope: !93)
!106 = !DILocation(line: 71, column: 13, scope: !93)
!107 = !DILocation(line: 74, column: 1, scope: !75)
