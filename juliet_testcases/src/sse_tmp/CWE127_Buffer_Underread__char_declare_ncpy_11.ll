; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_11.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_11_bad() #0 !dbg !11 {
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
  %call = call i32 (...) @globalReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx3, align 1, !dbg !40
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  %0 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  %call6 = call i64 @strlen(i8* %arraydecay5) #6, !dbg !44
  %call7 = call i8* @strncpy(i8* %arraydecay4, i8* %0, i64 %call6) #7, !dbg !45
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx8, align 1, !dbg !47
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  call void @printLine(i8* %arraydecay9), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @globalReturnsTrue(...) #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_11_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__char_declare_ncpy_11_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE127_Buffer_Underread__char_declare_ncpy_11_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !79
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  %call = call i32 (...) @globalReturnsFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !88
  store i8* %arraydecay1, i8** %data, align 8, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !94
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !95
  store i8 0, i8* %arrayidx3, align 1, !dbg !96
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !97
  %0 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  %call6 = call i64 @strlen(i8* %arraydecay5) #6, !dbg !100
  %call7 = call i8* @strncpy(i8* %arraydecay4, i8* %0, i64 %call6) #7, !dbg !101
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx8, align 1, !dbg !103
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  call void @printLine(i8* %arraydecay9), !dbg !105
  ret void, !dbg !106
}

declare dso_local i32 @globalReturnsFalse(...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !112
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  %call = call i32 (...) @globalReturnsTrue(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !118
  store i8* %arraydecay1, i8** %data, align 8, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx3, align 1, !dbg !127
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !128
  %0 = load i8*, i8** %data, align 8, !dbg !129
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  %call6 = call i64 @strlen(i8* %arraydecay5) #6, !dbg !131
  %call7 = call i8* @strncpy(i8* %arraydecay4, i8* %0, i64 %call6) #7, !dbg !132
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !133
  store i8 0, i8* %arrayidx8, align 1, !dbg !134
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !135
  call void @printLine(i8* %arraydecay9), !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_11_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!27 = !DILocation(line: 29, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!29 = !DILocation(line: 29, column: 8, scope: !11)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 30, column: 5)
!32 = !DILocation(line: 32, column: 27, scope: !31)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 35, type: !20)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DILocation(line: 35, column: 14, scope: !36)
!38 = !DILocation(line: 36, column: 9, scope: !36)
!39 = !DILocation(line: 37, column: 9, scope: !36)
!40 = !DILocation(line: 37, column: 21, scope: !36)
!41 = !DILocation(line: 39, column: 17, scope: !36)
!42 = !DILocation(line: 39, column: 23, scope: !36)
!43 = !DILocation(line: 39, column: 36, scope: !36)
!44 = !DILocation(line: 39, column: 29, scope: !36)
!45 = !DILocation(line: 39, column: 9, scope: !36)
!46 = !DILocation(line: 41, column: 9, scope: !36)
!47 = !DILocation(line: 41, column: 21, scope: !36)
!48 = !DILocation(line: 42, column: 19, scope: !36)
!49 = !DILocation(line: 42, column: 9, scope: !36)
!50 = !DILocation(line: 44, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_11_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 105, column: 5, scope: !51)
!53 = !DILocation(line: 106, column: 5, scope: !51)
!54 = !DILocation(line: 107, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !56, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 119, type: !58)
!61 = !DILocation(line: 119, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 119, type: !59)
!63 = !DILocation(line: 119, column: 27, scope: !55)
!64 = !DILocation(line: 122, column: 22, scope: !55)
!65 = !DILocation(line: 122, column: 12, scope: !55)
!66 = !DILocation(line: 122, column: 5, scope: !55)
!67 = !DILocation(line: 124, column: 5, scope: !55)
!68 = !DILocation(line: 125, column: 5, scope: !55)
!69 = !DILocation(line: 126, column: 5, scope: !55)
!70 = !DILocation(line: 129, column: 5, scope: !55)
!71 = !DILocation(line: 130, column: 5, scope: !55)
!72 = !DILocation(line: 131, column: 5, scope: !55)
!73 = !DILocation(line: 133, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 53, type: !16)
!76 = !DILocation(line: 53, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 54, type: !20)
!78 = !DILocation(line: 54, column: 10, scope: !74)
!79 = !DILocation(line: 55, column: 5, scope: !74)
!80 = !DILocation(line: 56, column: 5, scope: !74)
!81 = !DILocation(line: 56, column: 23, scope: !74)
!82 = !DILocation(line: 57, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !74, file: !12, line: 57, column: 8)
!84 = !DILocation(line: 57, column: 8, scope: !74)
!85 = !DILocation(line: 60, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !12, line: 58, column: 5)
!87 = !DILocation(line: 61, column: 5, scope: !86)
!88 = !DILocation(line: 65, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !12, line: 63, column: 5)
!90 = !DILocation(line: 65, column: 14, scope: !89)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !12, line: 68, type: !20)
!92 = distinct !DILexicalBlock(scope: !74, file: !12, line: 67, column: 5)
!93 = !DILocation(line: 68, column: 14, scope: !92)
!94 = !DILocation(line: 69, column: 9, scope: !92)
!95 = !DILocation(line: 70, column: 9, scope: !92)
!96 = !DILocation(line: 70, column: 21, scope: !92)
!97 = !DILocation(line: 72, column: 17, scope: !92)
!98 = !DILocation(line: 72, column: 23, scope: !92)
!99 = !DILocation(line: 72, column: 36, scope: !92)
!100 = !DILocation(line: 72, column: 29, scope: !92)
!101 = !DILocation(line: 72, column: 9, scope: !92)
!102 = !DILocation(line: 74, column: 9, scope: !92)
!103 = !DILocation(line: 74, column: 21, scope: !92)
!104 = !DILocation(line: 75, column: 19, scope: !92)
!105 = !DILocation(line: 75, column: 9, scope: !92)
!106 = !DILocation(line: 77, column: 1, scope: !74)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 82, type: !16)
!109 = !DILocation(line: 82, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !12, line: 83, type: !20)
!111 = !DILocation(line: 83, column: 10, scope: !107)
!112 = !DILocation(line: 84, column: 5, scope: !107)
!113 = !DILocation(line: 85, column: 5, scope: !107)
!114 = !DILocation(line: 85, column: 23, scope: !107)
!115 = !DILocation(line: 86, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !107, file: !12, line: 86, column: 8)
!117 = !DILocation(line: 86, column: 8, scope: !107)
!118 = !DILocation(line: 89, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 87, column: 5)
!120 = !DILocation(line: 89, column: 14, scope: !119)
!121 = !DILocation(line: 90, column: 5, scope: !119)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !12, line: 92, type: !20)
!123 = distinct !DILexicalBlock(scope: !107, file: !12, line: 91, column: 5)
!124 = !DILocation(line: 92, column: 14, scope: !123)
!125 = !DILocation(line: 93, column: 9, scope: !123)
!126 = !DILocation(line: 94, column: 9, scope: !123)
!127 = !DILocation(line: 94, column: 21, scope: !123)
!128 = !DILocation(line: 96, column: 17, scope: !123)
!129 = !DILocation(line: 96, column: 23, scope: !123)
!130 = !DILocation(line: 96, column: 36, scope: !123)
!131 = !DILocation(line: 96, column: 29, scope: !123)
!132 = !DILocation(line: 96, column: 9, scope: !123)
!133 = !DILocation(line: 98, column: 9, scope: !123)
!134 = !DILocation(line: 98, column: 21, scope: !123)
!135 = !DILocation(line: 99, column: 19, scope: !123)
!136 = !DILocation(line: 99, column: 9, scope: !123)
!137 = !DILocation(line: 101, column: 1, scope: !107)
