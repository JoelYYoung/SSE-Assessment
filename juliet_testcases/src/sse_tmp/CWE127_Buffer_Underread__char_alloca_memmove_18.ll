; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_18.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_memmove_18_bad() #0 !dbg !13 {
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
  br label %source, !dbg !26

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !27), !dbg !28
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !30
  store i8* %add.ptr, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx1, align 1, !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  %4 = load i8*, i8** %data, align 8, !dbg !42
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %4, i64 100, i1 false), !dbg !41
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx3, align 1, !dbg !44
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  call void @printLine(i8* %arraydecay4), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_memmove_18_good() #0 !dbg !48 {
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
  %call = call i64 @time(i64* null) #6, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #6, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE127_Buffer_Underread__char_alloca_memmove_18_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__char_alloca_memmove_18_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

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
  br label %source, !dbg !80

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !81), !dbg !82
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  store i8* %3, i8** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !85, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !88
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx1, align 1, !dbg !90
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %4, i64 100, i1 false), !dbg !91
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx3, align 1, !dbg !94
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  call void @printLine(i8* %arraydecay4), !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_memmove_18_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!32 = !DILocalVariable(name: "dest", scope: !33, file: !14, line: 34, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 34, column: 14, scope: !33)
!38 = !DILocation(line: 35, column: 9, scope: !33)
!39 = !DILocation(line: 36, column: 9, scope: !33)
!40 = !DILocation(line: 36, column: 21, scope: !33)
!41 = !DILocation(line: 38, column: 9, scope: !33)
!42 = !DILocation(line: 38, column: 23, scope: !33)
!43 = !DILocation(line: 40, column: 9, scope: !33)
!44 = !DILocation(line: 40, column: 21, scope: !33)
!45 = !DILocation(line: 41, column: 19, scope: !33)
!46 = !DILocation(line: 41, column: 9, scope: !33)
!47 = !DILocation(line: 43, column: 1, scope: !13)
!48 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_memmove_18_good", scope: !14, file: !14, line: 72, type: !15, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 74, column: 5, scope: !48)
!50 = !DILocation(line: 75, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 87, type: !52, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 87, type: !54)
!57 = !DILocation(line: 87, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 87, type: !55)
!59 = !DILocation(line: 87, column: 27, scope: !51)
!60 = !DILocation(line: 90, column: 22, scope: !51)
!61 = !DILocation(line: 90, column: 12, scope: !51)
!62 = !DILocation(line: 90, column: 5, scope: !51)
!63 = !DILocation(line: 92, column: 5, scope: !51)
!64 = !DILocation(line: 93, column: 5, scope: !51)
!65 = !DILocation(line: 94, column: 5, scope: !51)
!66 = !DILocation(line: 97, column: 5, scope: !51)
!67 = !DILocation(line: 98, column: 5, scope: !51)
!68 = !DILocation(line: 99, column: 5, scope: !51)
!69 = !DILocation(line: 101, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !14, line: 52, type: !4)
!72 = !DILocation(line: 52, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !14, line: 53, type: !4)
!74 = !DILocation(line: 53, column: 12, scope: !70)
!75 = !DILocation(line: 53, column: 33, scope: !70)
!76 = !DILocation(line: 54, column: 12, scope: !70)
!77 = !DILocation(line: 54, column: 5, scope: !70)
!78 = !DILocation(line: 55, column: 5, scope: !70)
!79 = !DILocation(line: 55, column: 23, scope: !70)
!80 = !DILocation(line: 56, column: 5, scope: !70)
!81 = !DILabel(scope: !70, name: "source", file: !14, line: 57)
!82 = !DILocation(line: 57, column: 1, scope: !70)
!83 = !DILocation(line: 59, column: 12, scope: !70)
!84 = !DILocation(line: 59, column: 10, scope: !70)
!85 = !DILocalVariable(name: "dest", scope: !86, file: !14, line: 61, type: !34)
!86 = distinct !DILexicalBlock(scope: !70, file: !14, line: 60, column: 5)
!87 = !DILocation(line: 61, column: 14, scope: !86)
!88 = !DILocation(line: 62, column: 9, scope: !86)
!89 = !DILocation(line: 63, column: 9, scope: !86)
!90 = !DILocation(line: 63, column: 21, scope: !86)
!91 = !DILocation(line: 65, column: 9, scope: !86)
!92 = !DILocation(line: 65, column: 23, scope: !86)
!93 = !DILocation(line: 67, column: 9, scope: !86)
!94 = !DILocation(line: 67, column: 21, scope: !86)
!95 = !DILocation(line: 68, column: 19, scope: !86)
!96 = !DILocation(line: 68, column: 9, scope: !86)
!97 = !DILocation(line: 70, column: 1, scope: !70)
