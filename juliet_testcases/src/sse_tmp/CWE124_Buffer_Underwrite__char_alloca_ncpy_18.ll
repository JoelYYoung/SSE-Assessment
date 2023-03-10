; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_18.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_18_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  br label %source, !dbg !26

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !27), !dbg !28
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !30
  store i8* %add.ptr, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx2, align 1, !dbg !40
  %4 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !42
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay3, i64 99) #5, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !44
  store i8 0, i8* %arrayidx4, align 1, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %6), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_18_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_18_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_18_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source1 = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 100, align 16, !dbg !76
  store i8* %0, i8** %dataBuffer, align 8, !dbg !75
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !78
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  br label %source, !dbg !81

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !82), !dbg !83
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  store i8* %3, i8** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i8]* %source1, metadata !86, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !89
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 99, !dbg !90
  store i8 0, i8* %arrayidx2, align 1, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source1, i64 0, i64 0, !dbg !93
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay3, i64 99) #5, !dbg !94
  %5 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !95
  store i8 0, i8* %arrayidx4, align 1, !dbg !96
  %6 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* %6), !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_18_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!26 = !DILocation(line: 29, column: 5, scope: !13)
!27 = !DILabel(scope: !13, name: "source", file: !14, line: 30)
!28 = !DILocation(line: 30, column: 1, scope: !13)
!29 = !DILocation(line: 32, column: 12, scope: !13)
!30 = !DILocation(line: 32, column: 23, scope: !13)
!31 = !DILocation(line: 32, column: 10, scope: !13)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 34, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 34, column: 14, scope: !33)
!38 = !DILocation(line: 35, column: 9, scope: !33)
!39 = !DILocation(line: 36, column: 9, scope: !33)
!40 = !DILocation(line: 36, column: 23, scope: !33)
!41 = !DILocation(line: 38, column: 17, scope: !33)
!42 = !DILocation(line: 38, column: 23, scope: !33)
!43 = !DILocation(line: 38, column: 9, scope: !33)
!44 = !DILocation(line: 40, column: 9, scope: !33)
!45 = !DILocation(line: 40, column: 21, scope: !33)
!46 = !DILocation(line: 41, column: 19, scope: !33)
!47 = !DILocation(line: 41, column: 9, scope: !33)
!48 = !DILocation(line: 43, column: 1, scope: !13)
!49 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_18_good", scope: !14, file: !14, line: 72, type: !15, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 74, column: 5, scope: !49)
!51 = !DILocation(line: 75, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 87, type: !53, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !14, line: 87, type: !55)
!58 = !DILocation(line: 87, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !14, line: 87, type: !56)
!60 = !DILocation(line: 87, column: 27, scope: !52)
!61 = !DILocation(line: 90, column: 22, scope: !52)
!62 = !DILocation(line: 90, column: 12, scope: !52)
!63 = !DILocation(line: 90, column: 5, scope: !52)
!64 = !DILocation(line: 92, column: 5, scope: !52)
!65 = !DILocation(line: 93, column: 5, scope: !52)
!66 = !DILocation(line: 94, column: 5, scope: !52)
!67 = !DILocation(line: 97, column: 5, scope: !52)
!68 = !DILocation(line: 98, column: 5, scope: !52)
!69 = !DILocation(line: 99, column: 5, scope: !52)
!70 = !DILocation(line: 101, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 52, type: !4)
!73 = !DILocation(line: 52, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !14, line: 53, type: !4)
!75 = !DILocation(line: 53, column: 12, scope: !71)
!76 = !DILocation(line: 53, column: 33, scope: !71)
!77 = !DILocation(line: 54, column: 12, scope: !71)
!78 = !DILocation(line: 54, column: 5, scope: !71)
!79 = !DILocation(line: 55, column: 5, scope: !71)
!80 = !DILocation(line: 55, column: 23, scope: !71)
!81 = !DILocation(line: 56, column: 5, scope: !71)
!82 = !DILabel(scope: !71, name: "source", file: !14, line: 57)
!83 = !DILocation(line: 57, column: 1, scope: !71)
!84 = !DILocation(line: 59, column: 12, scope: !71)
!85 = !DILocation(line: 59, column: 10, scope: !71)
!86 = !DILocalVariable(name: "source", scope: !87, file: !14, line: 61, type: !34)
!87 = distinct !DILexicalBlock(scope: !71, file: !14, line: 60, column: 5)
!88 = !DILocation(line: 61, column: 14, scope: !87)
!89 = !DILocation(line: 62, column: 9, scope: !87)
!90 = !DILocation(line: 63, column: 9, scope: !87)
!91 = !DILocation(line: 63, column: 23, scope: !87)
!92 = !DILocation(line: 65, column: 17, scope: !87)
!93 = !DILocation(line: 65, column: 23, scope: !87)
!94 = !DILocation(line: 65, column: 9, scope: !87)
!95 = !DILocation(line: 67, column: 9, scope: !87)
!96 = !DILocation(line: 67, column: 21, scope: !87)
!97 = !DILocation(line: 68, column: 19, scope: !87)
!98 = !DILocation(line: 68, column: 9, scope: !87)
!99 = !DILocation(line: 70, column: 1, scope: !71)
