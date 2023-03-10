; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_14.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_14_bad() #0 !dbg !11 {
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
  %0 = load i32, i32* @globalFive, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !33
  store i8* %add.ptr, i8** %data, align 8, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !38
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx3, align 1, !dbg !41
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !42
  %1 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !45
  %call6 = call i8* @strncpy(i8* %arraydecay4, i8* %1, i64 %call) #7, !dbg !46
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx7, align 1, !dbg !48
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @printLine(i8* %arraydecay8), !dbg !50
  ret void, !dbg !51
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
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_14_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
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
  call void @CWE127_Buffer_Underread__char_declare_ncpy_14_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__char_declare_ncpy_14_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !80
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !81
  store i8 0, i8* %arrayidx, align 1, !dbg !82
  %0 = load i32, i32* @globalFive, align 4, !dbg !83
  %cmp = icmp ne i32 %0, 5, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay1, i8** %data, align 8, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx3, align 1, !dbg !98
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  %1 = load i8*, i8** %data, align 8, !dbg !100
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !102
  %call6 = call i8* @strncpy(i8* %arraydecay4, i8* %1, i64 %call) #7, !dbg !103
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx7, align 1, !dbg !105
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  call void @printLine(i8* %arraydecay8), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !114
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %0 = load i32, i32* @globalFive, align 4, !dbg !117
  %cmp = icmp eq i32 %0, 5, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !121
  store i8* %arraydecay1, i8** %data, align 8, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !128
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx3, align 1, !dbg !130
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !131
  %1 = load i8*, i8** %data, align 8, !dbg !132
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !133
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !134
  %call6 = call i8* @strncpy(i8* %arraydecay4, i8* %1, i64 %call) #7, !dbg !135
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !136
  store i8 0, i8* %arrayidx7, align 1, !dbg !137
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !138
  call void @printLine(i8* %arraydecay8), !dbg !139
  ret void, !dbg !140
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocation(line: 29, column: 18, scope: !28)
!30 = !DILocation(line: 29, column: 8, scope: !11)
!31 = !DILocation(line: 32, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 30, column: 5)
!33 = !DILocation(line: 32, column: 27, scope: !32)
!34 = !DILocation(line: 32, column: 14, scope: !32)
!35 = !DILocation(line: 33, column: 5, scope: !32)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 35, type: !20)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 9, scope: !37)
!40 = !DILocation(line: 37, column: 9, scope: !37)
!41 = !DILocation(line: 37, column: 21, scope: !37)
!42 = !DILocation(line: 39, column: 17, scope: !37)
!43 = !DILocation(line: 39, column: 23, scope: !37)
!44 = !DILocation(line: 39, column: 36, scope: !37)
!45 = !DILocation(line: 39, column: 29, scope: !37)
!46 = !DILocation(line: 39, column: 9, scope: !37)
!47 = !DILocation(line: 41, column: 9, scope: !37)
!48 = !DILocation(line: 41, column: 21, scope: !37)
!49 = !DILocation(line: 42, column: 19, scope: !37)
!50 = !DILocation(line: 42, column: 9, scope: !37)
!51 = !DILocation(line: 44, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_14_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 105, column: 5, scope: !52)
!54 = !DILocation(line: 106, column: 5, scope: !52)
!55 = !DILocation(line: 107, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !57, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 119, type: !59)
!62 = !DILocation(line: 119, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 119, type: !60)
!64 = !DILocation(line: 119, column: 27, scope: !56)
!65 = !DILocation(line: 122, column: 22, scope: !56)
!66 = !DILocation(line: 122, column: 12, scope: !56)
!67 = !DILocation(line: 122, column: 5, scope: !56)
!68 = !DILocation(line: 124, column: 5, scope: !56)
!69 = !DILocation(line: 125, column: 5, scope: !56)
!70 = !DILocation(line: 126, column: 5, scope: !56)
!71 = !DILocation(line: 129, column: 5, scope: !56)
!72 = !DILocation(line: 130, column: 5, scope: !56)
!73 = !DILocation(line: 131, column: 5, scope: !56)
!74 = !DILocation(line: 133, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 53, type: !16)
!77 = !DILocation(line: 53, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !12, line: 54, type: !20)
!79 = !DILocation(line: 54, column: 10, scope: !75)
!80 = !DILocation(line: 55, column: 5, scope: !75)
!81 = !DILocation(line: 56, column: 5, scope: !75)
!82 = !DILocation(line: 56, column: 23, scope: !75)
!83 = !DILocation(line: 57, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !75, file: !12, line: 57, column: 8)
!85 = !DILocation(line: 57, column: 18, scope: !84)
!86 = !DILocation(line: 57, column: 8, scope: !75)
!87 = !DILocation(line: 60, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !12, line: 58, column: 5)
!89 = !DILocation(line: 61, column: 5, scope: !88)
!90 = !DILocation(line: 65, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !12, line: 63, column: 5)
!92 = !DILocation(line: 65, column: 14, scope: !91)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !12, line: 68, type: !20)
!94 = distinct !DILexicalBlock(scope: !75, file: !12, line: 67, column: 5)
!95 = !DILocation(line: 68, column: 14, scope: !94)
!96 = !DILocation(line: 69, column: 9, scope: !94)
!97 = !DILocation(line: 70, column: 9, scope: !94)
!98 = !DILocation(line: 70, column: 21, scope: !94)
!99 = !DILocation(line: 72, column: 17, scope: !94)
!100 = !DILocation(line: 72, column: 23, scope: !94)
!101 = !DILocation(line: 72, column: 36, scope: !94)
!102 = !DILocation(line: 72, column: 29, scope: !94)
!103 = !DILocation(line: 72, column: 9, scope: !94)
!104 = !DILocation(line: 74, column: 9, scope: !94)
!105 = !DILocation(line: 74, column: 21, scope: !94)
!106 = !DILocation(line: 75, column: 19, scope: !94)
!107 = !DILocation(line: 75, column: 9, scope: !94)
!108 = !DILocation(line: 77, column: 1, scope: !75)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 82, type: !16)
!111 = !DILocation(line: 82, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !12, line: 83, type: !20)
!113 = !DILocation(line: 83, column: 10, scope: !109)
!114 = !DILocation(line: 84, column: 5, scope: !109)
!115 = !DILocation(line: 85, column: 5, scope: !109)
!116 = !DILocation(line: 85, column: 23, scope: !109)
!117 = !DILocation(line: 86, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !109, file: !12, line: 86, column: 8)
!119 = !DILocation(line: 86, column: 18, scope: !118)
!120 = !DILocation(line: 86, column: 8, scope: !109)
!121 = !DILocation(line: 89, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 87, column: 5)
!123 = !DILocation(line: 89, column: 14, scope: !122)
!124 = !DILocation(line: 90, column: 5, scope: !122)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !12, line: 92, type: !20)
!126 = distinct !DILexicalBlock(scope: !109, file: !12, line: 91, column: 5)
!127 = !DILocation(line: 92, column: 14, scope: !126)
!128 = !DILocation(line: 93, column: 9, scope: !126)
!129 = !DILocation(line: 94, column: 9, scope: !126)
!130 = !DILocation(line: 94, column: 21, scope: !126)
!131 = !DILocation(line: 96, column: 17, scope: !126)
!132 = !DILocation(line: 96, column: 23, scope: !126)
!133 = !DILocation(line: 96, column: 36, scope: !126)
!134 = !DILocation(line: 96, column: 29, scope: !126)
!135 = !DILocation(line: 96, column: 9, scope: !126)
!136 = !DILocation(line: 98, column: 9, scope: !126)
!137 = !DILocation(line: 98, column: 21, scope: !126)
!138 = !DILocation(line: 99, column: 19, scope: !126)
!139 = !DILocation(line: 99, column: 9, scope: !126)
!140 = !DILocation(line: 101, column: 1, scope: !109)
