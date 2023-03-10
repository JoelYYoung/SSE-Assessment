; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_14.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
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
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !42
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !43
  store i8 0, i8* %arrayidx3, align 1, !dbg !44
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !45
  %1 = load i8*, i8** %data, align 8, !dbg !46
  %call = call i8* @strcpy(i8* %arraydecay4, i8* %1) #5, !dbg !47
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !48
  call void @printLine(i8* %arraydecay5), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_14_good() #0 !dbg !51 {
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
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__char_declare_cpy_14_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE127_Buffer_Underread__char_declare_cpy_14_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !79
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  %0 = load i32, i32* @globalFive, align 4, !dbg !82
  %cmp = icmp ne i32 %0, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !89
  store i8* %arraydecay1, i8** %data, align 8, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !95
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !96
  store i8 0, i8* %arrayidx3, align 1, !dbg !97
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !98
  %1 = load i8*, i8** %data, align 8, !dbg !99
  %call = call i8* @strcpy(i8* %arraydecay4, i8* %1) #5, !dbg !100
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !101
  call void @printLine(i8* %arraydecay5), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !109
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  %0 = load i32, i32* @globalFive, align 4, !dbg !112
  %cmp = icmp eq i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !116
  store i8* %arraydecay1, i8** %data, align 8, !dbg !118
  br label %if.end, !dbg !119

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !123
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !124
  store i8 0, i8* %arrayidx3, align 1, !dbg !125
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !126
  %1 = load i8*, i8** %data, align 8, !dbg !127
  %call = call i8* @strcpy(i8* %arraydecay4, i8* %1) #5, !dbg !128
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !129
  call void @printLine(i8* %arraydecay5), !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 200)
!41 = !DILocation(line: 35, column: 14, scope: !37)
!42 = !DILocation(line: 36, column: 9, scope: !37)
!43 = !DILocation(line: 37, column: 9, scope: !37)
!44 = !DILocation(line: 37, column: 23, scope: !37)
!45 = !DILocation(line: 39, column: 16, scope: !37)
!46 = !DILocation(line: 39, column: 22, scope: !37)
!47 = !DILocation(line: 39, column: 9, scope: !37)
!48 = !DILocation(line: 40, column: 19, scope: !37)
!49 = !DILocation(line: 40, column: 9, scope: !37)
!50 = !DILocation(line: 42, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_14_good", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 99, column: 5, scope: !51)
!53 = !DILocation(line: 100, column: 5, scope: !51)
!54 = !DILocation(line: 101, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 113, type: !56, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 113, type: !58)
!61 = !DILocation(line: 113, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 113, type: !59)
!63 = !DILocation(line: 113, column: 27, scope: !55)
!64 = !DILocation(line: 116, column: 22, scope: !55)
!65 = !DILocation(line: 116, column: 12, scope: !55)
!66 = !DILocation(line: 116, column: 5, scope: !55)
!67 = !DILocation(line: 118, column: 5, scope: !55)
!68 = !DILocation(line: 119, column: 5, scope: !55)
!69 = !DILocation(line: 120, column: 5, scope: !55)
!70 = !DILocation(line: 123, column: 5, scope: !55)
!71 = !DILocation(line: 124, column: 5, scope: !55)
!72 = !DILocation(line: 125, column: 5, scope: !55)
!73 = !DILocation(line: 127, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 51, type: !16)
!76 = !DILocation(line: 51, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 52, type: !20)
!78 = !DILocation(line: 52, column: 10, scope: !74)
!79 = !DILocation(line: 53, column: 5, scope: !74)
!80 = !DILocation(line: 54, column: 5, scope: !74)
!81 = !DILocation(line: 54, column: 23, scope: !74)
!82 = !DILocation(line: 55, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !74, file: !12, line: 55, column: 8)
!84 = !DILocation(line: 55, column: 18, scope: !83)
!85 = !DILocation(line: 55, column: 8, scope: !74)
!86 = !DILocation(line: 58, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !12, line: 56, column: 5)
!88 = !DILocation(line: 59, column: 5, scope: !87)
!89 = !DILocation(line: 63, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !12, line: 61, column: 5)
!91 = !DILocation(line: 63, column: 14, scope: !90)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !12, line: 66, type: !38)
!93 = distinct !DILexicalBlock(scope: !74, file: !12, line: 65, column: 5)
!94 = !DILocation(line: 66, column: 14, scope: !93)
!95 = !DILocation(line: 67, column: 9, scope: !93)
!96 = !DILocation(line: 68, column: 9, scope: !93)
!97 = !DILocation(line: 68, column: 23, scope: !93)
!98 = !DILocation(line: 70, column: 16, scope: !93)
!99 = !DILocation(line: 70, column: 22, scope: !93)
!100 = !DILocation(line: 70, column: 9, scope: !93)
!101 = !DILocation(line: 71, column: 19, scope: !93)
!102 = !DILocation(line: 71, column: 9, scope: !93)
!103 = !DILocation(line: 73, column: 1, scope: !74)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 78, type: !16)
!106 = !DILocation(line: 78, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !12, line: 79, type: !20)
!108 = !DILocation(line: 79, column: 10, scope: !104)
!109 = !DILocation(line: 80, column: 5, scope: !104)
!110 = !DILocation(line: 81, column: 5, scope: !104)
!111 = !DILocation(line: 81, column: 23, scope: !104)
!112 = !DILocation(line: 82, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !12, line: 82, column: 8)
!114 = !DILocation(line: 82, column: 18, scope: !113)
!115 = !DILocation(line: 82, column: 8, scope: !104)
!116 = !DILocation(line: 85, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 83, column: 5)
!118 = !DILocation(line: 85, column: 14, scope: !117)
!119 = !DILocation(line: 86, column: 5, scope: !117)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !12, line: 88, type: !38)
!121 = distinct !DILexicalBlock(scope: !104, file: !12, line: 87, column: 5)
!122 = !DILocation(line: 88, column: 14, scope: !121)
!123 = !DILocation(line: 89, column: 9, scope: !121)
!124 = !DILocation(line: 90, column: 9, scope: !121)
!125 = !DILocation(line: 90, column: 23, scope: !121)
!126 = !DILocation(line: 92, column: 16, scope: !121)
!127 = !DILocation(line: 92, column: 22, scope: !121)
!128 = !DILocation(line: 92, column: 9, scope: !121)
!129 = !DILocation(line: 93, column: 19, scope: !121)
!130 = !DILocation(line: 93, column: 9, scope: !121)
!131 = !DILocation(line: 95, column: 1, scope: !104)
