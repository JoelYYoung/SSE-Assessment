; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_08_bad() #0 !dbg !13 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !31
  store i8* %add.ptr, i8** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !46
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !47
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx6, align 1, !dbg !49
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @printLine(i8* %arraydecay7), !dbg !51
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
define dso_local void @CWE127_Buffer_Underread__char_alloca_ncpy_08_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_08_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__char_alloca_ncpy_08_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !76 {
entry:
  ret i32 1, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 100, align 16, !dbg !85
  store i8* %0, i8** %dataBuffer, align 8, !dbg !84
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !87
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  %call = call i32 @staticReturnsFalse(), !dbg !90
  %tobool = icmp ne i32 %call, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  store i8* %3, i8** %data, align 8, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !102
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !103
  store i8 0, i8* %arrayidx1, align 1, !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !105
  %4 = load i8*, i8** %data, align 8, !dbg !106
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !108
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !109
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx6, align 1, !dbg !111
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  call void @printLine(i8* %arraydecay7), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !115 {
entry:
  ret i32 0, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = alloca i8, i64 100, align 16, !dbg !122
  store i8* %0, i8** %dataBuffer, align 8, !dbg !121
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !124
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  %call = call i32 @staticReturnsTrue(), !dbg !127
  %tobool = icmp ne i32 %call, 0, !dbg !127
  br i1 %tobool, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !130
  store i8* %3, i8** %data, align 8, !dbg !132
  br label %if.end, !dbg !133

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !137
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !138
  store i8 0, i8* %arrayidx1, align 1, !dbg !139
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  %4 = load i8*, i8** %data, align 8, !dbg !141
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  %call4 = call i64 @strlen(i8* %arraydecay3) #6, !dbg !143
  %call5 = call i8* @strncpy(i8* %arraydecay2, i8* %4, i64 %call4) #7, !dbg !144
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !145
  store i8 0, i8* %arrayidx6, align 1, !dbg !146
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !147
  call void @printLine(i8* %arraydecay7), !dbg !148
  ret void, !dbg !149
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_ncpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 40, type: !4)
!20 = !DILocation(line: 40, column: 12, scope: !13)
!21 = !DILocation(line: 40, column: 33, scope: !13)
!22 = !DILocation(line: 41, column: 12, scope: !13)
!23 = !DILocation(line: 41, column: 5, scope: !13)
!24 = !DILocation(line: 42, column: 5, scope: !13)
!25 = !DILocation(line: 42, column: 23, scope: !13)
!26 = !DILocation(line: 43, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 8)
!28 = !DILocation(line: 43, column: 8, scope: !13)
!29 = !DILocation(line: 46, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 44, column: 5)
!31 = !DILocation(line: 46, column: 27, scope: !30)
!32 = !DILocation(line: 46, column: 14, scope: !30)
!33 = !DILocation(line: 47, column: 5, scope: !30)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !14, line: 49, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 48, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 49, column: 14, scope: !35)
!40 = !DILocation(line: 50, column: 9, scope: !35)
!41 = !DILocation(line: 51, column: 9, scope: !35)
!42 = !DILocation(line: 51, column: 21, scope: !35)
!43 = !DILocation(line: 53, column: 17, scope: !35)
!44 = !DILocation(line: 53, column: 23, scope: !35)
!45 = !DILocation(line: 53, column: 36, scope: !35)
!46 = !DILocation(line: 53, column: 29, scope: !35)
!47 = !DILocation(line: 53, column: 9, scope: !35)
!48 = !DILocation(line: 55, column: 9, scope: !35)
!49 = !DILocation(line: 55, column: 21, scope: !35)
!50 = !DILocation(line: 56, column: 19, scope: !35)
!51 = !DILocation(line: 56, column: 9, scope: !35)
!52 = !DILocation(line: 58, column: 1, scope: !13)
!53 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_ncpy_08_good", scope: !14, file: !14, line: 117, type: !15, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 119, column: 5, scope: !53)
!55 = !DILocation(line: 120, column: 5, scope: !53)
!56 = !DILocation(line: 121, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 133, type: !58, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !14, line: 133, type: !60)
!63 = !DILocation(line: 133, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !14, line: 133, type: !61)
!65 = !DILocation(line: 133, column: 27, scope: !57)
!66 = !DILocation(line: 136, column: 22, scope: !57)
!67 = !DILocation(line: 136, column: 12, scope: !57)
!68 = !DILocation(line: 136, column: 5, scope: !57)
!69 = !DILocation(line: 138, column: 5, scope: !57)
!70 = !DILocation(line: 139, column: 5, scope: !57)
!71 = !DILocation(line: 140, column: 5, scope: !57)
!72 = !DILocation(line: 143, column: 5, scope: !57)
!73 = !DILocation(line: 144, column: 5, scope: !57)
!74 = !DILocation(line: 145, column: 5, scope: !57)
!75 = !DILocation(line: 147, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !77, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!60}
!79 = !DILocation(line: 27, column: 5, scope: !76)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !14, line: 67, type: !4)
!82 = !DILocation(line: 67, column: 12, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !14, line: 68, type: !4)
!84 = !DILocation(line: 68, column: 12, scope: !80)
!85 = !DILocation(line: 68, column: 33, scope: !80)
!86 = !DILocation(line: 69, column: 12, scope: !80)
!87 = !DILocation(line: 69, column: 5, scope: !80)
!88 = !DILocation(line: 70, column: 5, scope: !80)
!89 = !DILocation(line: 70, column: 23, scope: !80)
!90 = !DILocation(line: 71, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !80, file: !14, line: 71, column: 8)
!92 = !DILocation(line: 71, column: 8, scope: !80)
!93 = !DILocation(line: 74, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !14, line: 72, column: 5)
!95 = !DILocation(line: 75, column: 5, scope: !94)
!96 = !DILocation(line: 79, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !14, line: 77, column: 5)
!98 = !DILocation(line: 79, column: 14, scope: !97)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !14, line: 82, type: !36)
!100 = distinct !DILexicalBlock(scope: !80, file: !14, line: 81, column: 5)
!101 = !DILocation(line: 82, column: 14, scope: !100)
!102 = !DILocation(line: 83, column: 9, scope: !100)
!103 = !DILocation(line: 84, column: 9, scope: !100)
!104 = !DILocation(line: 84, column: 21, scope: !100)
!105 = !DILocation(line: 86, column: 17, scope: !100)
!106 = !DILocation(line: 86, column: 23, scope: !100)
!107 = !DILocation(line: 86, column: 36, scope: !100)
!108 = !DILocation(line: 86, column: 29, scope: !100)
!109 = !DILocation(line: 86, column: 9, scope: !100)
!110 = !DILocation(line: 88, column: 9, scope: !100)
!111 = !DILocation(line: 88, column: 21, scope: !100)
!112 = !DILocation(line: 89, column: 19, scope: !100)
!113 = !DILocation(line: 89, column: 9, scope: !100)
!114 = !DILocation(line: 91, column: 1, scope: !80)
!115 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !77, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocation(line: 32, column: 5, scope: !115)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 94, type: !15, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !14, line: 96, type: !4)
!119 = !DILocation(line: 96, column: 12, scope: !117)
!120 = !DILocalVariable(name: "dataBuffer", scope: !117, file: !14, line: 97, type: !4)
!121 = !DILocation(line: 97, column: 12, scope: !117)
!122 = !DILocation(line: 97, column: 33, scope: !117)
!123 = !DILocation(line: 98, column: 12, scope: !117)
!124 = !DILocation(line: 98, column: 5, scope: !117)
!125 = !DILocation(line: 99, column: 5, scope: !117)
!126 = !DILocation(line: 99, column: 23, scope: !117)
!127 = !DILocation(line: 100, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !117, file: !14, line: 100, column: 8)
!129 = !DILocation(line: 100, column: 8, scope: !117)
!130 = !DILocation(line: 103, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !14, line: 101, column: 5)
!132 = !DILocation(line: 103, column: 14, scope: !131)
!133 = !DILocation(line: 104, column: 5, scope: !131)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !14, line: 106, type: !36)
!135 = distinct !DILexicalBlock(scope: !117, file: !14, line: 105, column: 5)
!136 = !DILocation(line: 106, column: 14, scope: !135)
!137 = !DILocation(line: 107, column: 9, scope: !135)
!138 = !DILocation(line: 108, column: 9, scope: !135)
!139 = !DILocation(line: 108, column: 21, scope: !135)
!140 = !DILocation(line: 110, column: 17, scope: !135)
!141 = !DILocation(line: 110, column: 23, scope: !135)
!142 = !DILocation(line: 110, column: 36, scope: !135)
!143 = !DILocation(line: 110, column: 29, scope: !135)
!144 = !DILocation(line: 110, column: 9, scope: !135)
!145 = !DILocation(line: 112, column: 9, scope: !135)
!146 = !DILocation(line: 112, column: 21, scope: !135)
!147 = !DILocation(line: 113, column: 19, scope: !135)
!148 = !DILocation(line: 113, column: 9, scope: !135)
!149 = !DILocation(line: 115, column: 1, scope: !117)
