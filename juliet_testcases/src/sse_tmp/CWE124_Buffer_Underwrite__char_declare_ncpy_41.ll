; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_ncpy_41_badSink(i8* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !25
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  %0 = load i8*, i8** %data.addr, align 8, !dbg !28
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !29
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #5, !dbg !30
  %1 = load i8*, i8** %data.addr, align 8, !dbg !31
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !31
  store i8 0, i8* %arrayidx2, align 1, !dbg !32
  %2 = load i8*, i8** %data.addr, align 8, !dbg !33
  call void @printLine(i8* %2), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_ncpy_41_bad() #0 !dbg !36 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !41, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !43
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx, align 1, !dbg !45
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !46
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !47
  store i8* %add.ptr, i8** %data, align 8, !dbg !48
  %0 = load i8*, i8** %data, align 8, !dbg !49
  call void @CWE124_Buffer_Underwrite__char_declare_ncpy_41_badSink(i8* %0), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_ncpy_41_goodG2BSink(i8* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !55, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !58
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx, align 1, !dbg !60
  %0 = load i8*, i8** %data.addr, align 8, !dbg !61
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !62
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #5, !dbg !63
  %1 = load i8*, i8** %data.addr, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !64
  store i8 0, i8* %arrayidx2, align 1, !dbg !65
  %2 = load i8*, i8** %data.addr, align 8, !dbg !66
  call void @printLine(i8* %2), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_ncpy_41_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE124_Buffer_Underwrite__char_declare_ncpy_41_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE124_Buffer_Underwrite__char_declare_ncpy_41_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !96
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !99
  store i8* %arraydecay1, i8** %data, align 8, !dbg !100
  %0 = load i8*, i8** %data, align 8, !dbg !101
  call void @CWE124_Buffer_Underwrite__char_declare_ncpy_41_goodG2BSink(i8* %0), !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_ncpy_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!18 = !DILocation(line: 23, column: 68, scope: !11)
!19 = !DILocalVariable(name: "source", scope: !20, file: !12, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 14, scope: !20)
!25 = !DILocation(line: 27, column: 9, scope: !20)
!26 = !DILocation(line: 28, column: 9, scope: !20)
!27 = !DILocation(line: 28, column: 23, scope: !20)
!28 = !DILocation(line: 30, column: 17, scope: !20)
!29 = !DILocation(line: 30, column: 23, scope: !20)
!30 = !DILocation(line: 30, column: 9, scope: !20)
!31 = !DILocation(line: 32, column: 9, scope: !20)
!32 = !DILocation(line: 32, column: 21, scope: !20)
!33 = !DILocation(line: 33, column: 19, scope: !20)
!34 = !DILocation(line: 33, column: 9, scope: !20)
!35 = !DILocation(line: 35, column: 1, scope: !11)
!36 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_ncpy_41_bad", scope: !12, file: !12, line: 37, type: !37, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 39, type: !15)
!40 = !DILocation(line: 39, column: 12, scope: !36)
!41 = !DILocalVariable(name: "dataBuffer", scope: !36, file: !12, line: 40, type: !21)
!42 = !DILocation(line: 40, column: 10, scope: !36)
!43 = !DILocation(line: 41, column: 5, scope: !36)
!44 = !DILocation(line: 42, column: 5, scope: !36)
!45 = !DILocation(line: 42, column: 23, scope: !36)
!46 = !DILocation(line: 44, column: 12, scope: !36)
!47 = !DILocation(line: 44, column: 23, scope: !36)
!48 = !DILocation(line: 44, column: 10, scope: !36)
!49 = !DILocation(line: 45, column: 60, scope: !36)
!50 = !DILocation(line: 45, column: 5, scope: !36)
!51 = !DILocation(line: 46, column: 1, scope: !36)
!52 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_ncpy_41_goodG2BSink", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !12, line: 52, type: !15)
!54 = !DILocation(line: 52, column: 72, scope: !52)
!55 = !DILocalVariable(name: "source", scope: !56, file: !12, line: 55, type: !21)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 54, column: 5)
!57 = !DILocation(line: 55, column: 14, scope: !56)
!58 = !DILocation(line: 56, column: 9, scope: !56)
!59 = !DILocation(line: 57, column: 9, scope: !56)
!60 = !DILocation(line: 57, column: 23, scope: !56)
!61 = !DILocation(line: 59, column: 17, scope: !56)
!62 = !DILocation(line: 59, column: 23, scope: !56)
!63 = !DILocation(line: 59, column: 9, scope: !56)
!64 = !DILocation(line: 61, column: 9, scope: !56)
!65 = !DILocation(line: 61, column: 21, scope: !56)
!66 = !DILocation(line: 62, column: 19, scope: !56)
!67 = !DILocation(line: 62, column: 9, scope: !56)
!68 = !DILocation(line: 64, column: 1, scope: !52)
!69 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_ncpy_41_good", scope: !12, file: !12, line: 78, type: !37, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 80, column: 5, scope: !69)
!71 = !DILocation(line: 81, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 93, type: !73, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !75, !76}
!75 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 93, type: !75)
!78 = !DILocation(line: 93, column: 14, scope: !72)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 93, type: !76)
!80 = !DILocation(line: 93, column: 27, scope: !72)
!81 = !DILocation(line: 96, column: 22, scope: !72)
!82 = !DILocation(line: 96, column: 12, scope: !72)
!83 = !DILocation(line: 96, column: 5, scope: !72)
!84 = !DILocation(line: 98, column: 5, scope: !72)
!85 = !DILocation(line: 99, column: 5, scope: !72)
!86 = !DILocation(line: 100, column: 5, scope: !72)
!87 = !DILocation(line: 103, column: 5, scope: !72)
!88 = !DILocation(line: 104, column: 5, scope: !72)
!89 = !DILocation(line: 105, column: 5, scope: !72)
!90 = !DILocation(line: 107, column: 5, scope: !72)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !37, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 69, type: !15)
!93 = !DILocation(line: 69, column: 12, scope: !91)
!94 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !12, line: 70, type: !21)
!95 = !DILocation(line: 70, column: 10, scope: !91)
!96 = !DILocation(line: 71, column: 5, scope: !91)
!97 = !DILocation(line: 72, column: 5, scope: !91)
!98 = !DILocation(line: 72, column: 23, scope: !91)
!99 = !DILocation(line: 74, column: 12, scope: !91)
!100 = !DILocation(line: 74, column: 10, scope: !91)
!101 = !DILocation(line: 75, column: 64, scope: !91)
!102 = !DILocation(line: 75, column: 5, scope: !91)
!103 = !DILocation(line: 76, column: 1, scope: !91)
