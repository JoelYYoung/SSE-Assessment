; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_42_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  %call = call i8* @badSource(i8* %2), !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !27, metadata !DIExpression()), !dbg !32
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  %call1 = call i8* @strcat(i8* %arraydecay, i8* %4) #5, !dbg !35
  %5 = load i8*, i8** %data, align 8, !dbg !36
  call void @printLine(i8* %5), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i8*, i8** %data.addr, align 8, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !45
  %1 = load i8*, i8** %data.addr, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !46
  store i8 0, i8* %arrayidx, align 1, !dbg !47
  %2 = load i8*, i8** %data.addr, align 8, !dbg !48
  ret i8* %2, !dbg !49
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_42_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_42_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_42_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 100, align 16, !dbg !77
  store i8* %0, i8** %dataBuffer, align 8, !dbg !76
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !78
  store i8* %1, i8** %data, align 8, !dbg !79
  %2 = load i8*, i8** %data, align 8, !dbg !80
  %call = call i8* @goodG2BSource(i8* %2), !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !83, metadata !DIExpression()), !dbg !85
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !85
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !87
  %call1 = call i8* @strcat(i8* %arraydecay, i8* %4) #5, !dbg !88
  %5 = load i8*, i8** %data, align 8, !dbg !89
  call void @printLine(i8* %5), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !92 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = load i8*, i8** %data.addr, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !96
  %1 = load i8*, i8** %data.addr, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %2 = load i8*, i8** %data.addr, align 8, !dbg !99
  ret i8* %2, !dbg !100
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_42.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_42_bad", scope: !14, file: !14, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_42.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !4)
!18 = !DILocation(line: 33, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 34, type: !4)
!20 = !DILocation(line: 34, column: 12, scope: !13)
!21 = !DILocation(line: 34, column: 33, scope: !13)
!22 = !DILocation(line: 35, column: 12, scope: !13)
!23 = !DILocation(line: 35, column: 10, scope: !13)
!24 = !DILocation(line: 36, column: 22, scope: !13)
!25 = !DILocation(line: 36, column: 12, scope: !13)
!26 = !DILocation(line: 36, column: 10, scope: !13)
!27 = !DILocalVariable(name: "dest", scope: !28, file: !14, line: 38, type: !29)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 38, column: 14, scope: !28)
!33 = !DILocation(line: 40, column: 16, scope: !28)
!34 = !DILocation(line: 40, column: 22, scope: !28)
!35 = !DILocation(line: 40, column: 9, scope: !28)
!36 = !DILocation(line: 41, column: 19, scope: !28)
!37 = !DILocation(line: 41, column: 9, scope: !28)
!38 = !DILocation(line: 43, column: 1, scope: !13)
!39 = distinct !DISubprogram(name: "badSource", scope: !14, file: !14, line: 23, type: !40, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!4, !4}
!42 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !14, line: 23, type: !4)
!43 = !DILocation(line: 23, column: 32, scope: !39)
!44 = !DILocation(line: 26, column: 12, scope: !39)
!45 = !DILocation(line: 26, column: 5, scope: !39)
!46 = !DILocation(line: 27, column: 5, scope: !39)
!47 = !DILocation(line: 27, column: 17, scope: !39)
!48 = !DILocation(line: 28, column: 12, scope: !39)
!49 = !DILocation(line: 28, column: 5, scope: !39)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_42_good", scope: !14, file: !14, line: 72, type: !15, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 74, column: 5, scope: !50)
!52 = !DILocation(line: 75, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 87, type: !54, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 87, type: !56)
!59 = !DILocation(line: 87, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 87, type: !57)
!61 = !DILocation(line: 87, column: 27, scope: !53)
!62 = !DILocation(line: 90, column: 22, scope: !53)
!63 = !DILocation(line: 90, column: 12, scope: !53)
!64 = !DILocation(line: 90, column: 5, scope: !53)
!65 = !DILocation(line: 92, column: 5, scope: !53)
!66 = !DILocation(line: 93, column: 5, scope: !53)
!67 = !DILocation(line: 94, column: 5, scope: !53)
!68 = !DILocation(line: 97, column: 5, scope: !53)
!69 = !DILocation(line: 98, column: 5, scope: !53)
!70 = !DILocation(line: 99, column: 5, scope: !53)
!71 = !DILocation(line: 101, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 60, type: !4)
!74 = !DILocation(line: 60, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !14, line: 61, type: !4)
!76 = !DILocation(line: 61, column: 12, scope: !72)
!77 = !DILocation(line: 61, column: 33, scope: !72)
!78 = !DILocation(line: 62, column: 12, scope: !72)
!79 = !DILocation(line: 62, column: 10, scope: !72)
!80 = !DILocation(line: 63, column: 26, scope: !72)
!81 = !DILocation(line: 63, column: 12, scope: !72)
!82 = !DILocation(line: 63, column: 10, scope: !72)
!83 = !DILocalVariable(name: "dest", scope: !84, file: !14, line: 65, type: !29)
!84 = distinct !DILexicalBlock(scope: !72, file: !14, line: 64, column: 5)
!85 = !DILocation(line: 65, column: 14, scope: !84)
!86 = !DILocation(line: 67, column: 16, scope: !84)
!87 = !DILocation(line: 67, column: 22, scope: !84)
!88 = !DILocation(line: 67, column: 9, scope: !84)
!89 = !DILocation(line: 68, column: 19, scope: !84)
!90 = !DILocation(line: 68, column: 9, scope: !84)
!91 = !DILocation(line: 70, column: 1, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2BSource", scope: !14, file: !14, line: 49, type: !40, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", arg: 1, scope: !92, file: !14, line: 49, type: !4)
!94 = !DILocation(line: 49, column: 36, scope: !92)
!95 = !DILocation(line: 52, column: 12, scope: !92)
!96 = !DILocation(line: 52, column: 5, scope: !92)
!97 = !DILocation(line: 53, column: 5, scope: !92)
!98 = !DILocation(line: 53, column: 16, scope: !92)
!99 = !DILocation(line: 54, column: 12, scope: !92)
!100 = !DILocation(line: 54, column: 5, scope: !92)
