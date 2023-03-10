; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_cpy_41_badSink(i8* %data) #0 !dbg !11 {
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
  %call = call i8* @strcpy(i8* %0, i8* %arraydecay1) #5, !dbg !30
  %1 = load i8*, i8** %data.addr, align 8, !dbg !31
  call void @printLine(i8* %1), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_cpy_41_bad() #0 !dbg !34 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !39, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !41
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !44
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !45
  store i8* %add.ptr, i8** %data, align 8, !dbg !46
  %0 = load i8*, i8** %data, align 8, !dbg !47
  call void @CWE124_Buffer_Underwrite__char_declare_cpy_41_badSink(i8* %0), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_cpy_41_goodG2BSink(i8* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !53, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !56
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx, align 1, !dbg !58
  %0 = load i8*, i8** %data.addr, align 8, !dbg !59
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !60
  %call = call i8* @strcpy(i8* %0, i8* %arraydecay1) #5, !dbg !61
  %1 = load i8*, i8** %data.addr, align 8, !dbg !62
  call void @printLine(i8* %1), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_cpy_41_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__char_declare_cpy_41_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE124_Buffer_Underwrite__char_declare_cpy_41_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !92
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !95
  store i8* %arraydecay1, i8** %data, align 8, !dbg !96
  %0 = load i8*, i8** %data, align 8, !dbg !97
  call void @CWE124_Buffer_Underwrite__char_declare_cpy_41_goodG2BSink(i8* %0), !dbg !98
  ret void, !dbg !99
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_cpy_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!18 = !DILocation(line: 23, column: 67, scope: !11)
!19 = !DILocalVariable(name: "source", scope: !20, file: !12, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 14, scope: !20)
!25 = !DILocation(line: 27, column: 9, scope: !20)
!26 = !DILocation(line: 28, column: 9, scope: !20)
!27 = !DILocation(line: 28, column: 23, scope: !20)
!28 = !DILocation(line: 30, column: 16, scope: !20)
!29 = !DILocation(line: 30, column: 22, scope: !20)
!30 = !DILocation(line: 30, column: 9, scope: !20)
!31 = !DILocation(line: 31, column: 19, scope: !20)
!32 = !DILocation(line: 31, column: 9, scope: !20)
!33 = !DILocation(line: 33, column: 1, scope: !11)
!34 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_cpy_41_bad", scope: !12, file: !12, line: 35, type: !35, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{null}
!37 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 37, type: !15)
!38 = !DILocation(line: 37, column: 12, scope: !34)
!39 = !DILocalVariable(name: "dataBuffer", scope: !34, file: !12, line: 38, type: !21)
!40 = !DILocation(line: 38, column: 10, scope: !34)
!41 = !DILocation(line: 39, column: 5, scope: !34)
!42 = !DILocation(line: 40, column: 5, scope: !34)
!43 = !DILocation(line: 40, column: 23, scope: !34)
!44 = !DILocation(line: 42, column: 12, scope: !34)
!45 = !DILocation(line: 42, column: 23, scope: !34)
!46 = !DILocation(line: 42, column: 10, scope: !34)
!47 = !DILocation(line: 43, column: 59, scope: !34)
!48 = !DILocation(line: 43, column: 5, scope: !34)
!49 = !DILocation(line: 44, column: 1, scope: !34)
!50 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_cpy_41_goodG2BSink", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !12, line: 50, type: !15)
!52 = !DILocation(line: 50, column: 71, scope: !50)
!53 = !DILocalVariable(name: "source", scope: !54, file: !12, line: 53, type: !21)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 52, column: 5)
!55 = !DILocation(line: 53, column: 14, scope: !54)
!56 = !DILocation(line: 54, column: 9, scope: !54)
!57 = !DILocation(line: 55, column: 9, scope: !54)
!58 = !DILocation(line: 55, column: 23, scope: !54)
!59 = !DILocation(line: 57, column: 16, scope: !54)
!60 = !DILocation(line: 57, column: 22, scope: !54)
!61 = !DILocation(line: 57, column: 9, scope: !54)
!62 = !DILocation(line: 58, column: 19, scope: !54)
!63 = !DILocation(line: 58, column: 9, scope: !54)
!64 = !DILocation(line: 60, column: 1, scope: !50)
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_cpy_41_good", scope: !12, file: !12, line: 74, type: !35, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 76, column: 5, scope: !65)
!67 = !DILocation(line: 77, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !69, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !72}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 89, type: !71)
!74 = !DILocation(line: 89, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 89, type: !72)
!76 = !DILocation(line: 89, column: 27, scope: !68)
!77 = !DILocation(line: 92, column: 22, scope: !68)
!78 = !DILocation(line: 92, column: 12, scope: !68)
!79 = !DILocation(line: 92, column: 5, scope: !68)
!80 = !DILocation(line: 94, column: 5, scope: !68)
!81 = !DILocation(line: 95, column: 5, scope: !68)
!82 = !DILocation(line: 96, column: 5, scope: !68)
!83 = !DILocation(line: 99, column: 5, scope: !68)
!84 = !DILocation(line: 100, column: 5, scope: !68)
!85 = !DILocation(line: 101, column: 5, scope: !68)
!86 = !DILocation(line: 103, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !35, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 65, type: !15)
!89 = !DILocation(line: 65, column: 12, scope: !87)
!90 = !DILocalVariable(name: "dataBuffer", scope: !87, file: !12, line: 66, type: !21)
!91 = !DILocation(line: 66, column: 10, scope: !87)
!92 = !DILocation(line: 67, column: 5, scope: !87)
!93 = !DILocation(line: 68, column: 5, scope: !87)
!94 = !DILocation(line: 68, column: 23, scope: !87)
!95 = !DILocation(line: 70, column: 12, scope: !87)
!96 = !DILocation(line: 70, column: 10, scope: !87)
!97 = !DILocation(line: 71, column: 63, scope: !87)
!98 = !DILocation(line: 71, column: 5, scope: !87)
!99 = !DILocation(line: 72, column: 1, scope: !87)
