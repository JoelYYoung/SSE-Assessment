; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_10.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_10_bad() #0 !dbg !11 {
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
  %0 = load i32, i32* @globalTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !41
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !42
  store i8 0, i8* %arrayidx3, align 1, !dbg !43
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !44
  %1 = load i8*, i8** %data, align 8, !dbg !45
  %call = call i8* @strcpy(i8* %arraydecay4, i8* %1) #5, !dbg !46
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @printLine(i8* %arraydecay5), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_10_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__char_declare_cpy_10_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__char_declare_cpy_10_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !78
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  %0 = load i32, i32* @globalFalse, align 4, !dbg !81
  %tobool = icmp ne i32 %0, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !87
  store i8* %arraydecay1, i8** %data, align 8, !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !93
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !94
  store i8 0, i8* %arrayidx3, align 1, !dbg !95
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !96
  %1 = load i8*, i8** %data, align 8, !dbg !97
  %call = call i8* @strcpy(i8* %arraydecay4, i8* %1) #5, !dbg !98
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !99
  call void @printLine(i8* %arraydecay5), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !107
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %0 = load i32, i32* @globalTrue, align 4, !dbg !110
  %tobool = icmp ne i32 %0, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !113
  store i8* %arraydecay1, i8** %data, align 8, !dbg !115
  br label %if.end, !dbg !116

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !120
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !121
  store i8 0, i8* %arrayidx3, align 1, !dbg !122
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !123
  %1 = load i8*, i8** %data, align 8, !dbg !124
  %call = call i8* @strcpy(i8* %arraydecay4, i8* %1) #5, !dbg !125
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @printLine(i8* %arraydecay5), !dbg !127
  ret void, !dbg !128
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_10_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 200)
!40 = !DILocation(line: 35, column: 14, scope: !36)
!41 = !DILocation(line: 36, column: 9, scope: !36)
!42 = !DILocation(line: 37, column: 9, scope: !36)
!43 = !DILocation(line: 37, column: 23, scope: !36)
!44 = !DILocation(line: 39, column: 16, scope: !36)
!45 = !DILocation(line: 39, column: 22, scope: !36)
!46 = !DILocation(line: 39, column: 9, scope: !36)
!47 = !DILocation(line: 40, column: 19, scope: !36)
!48 = !DILocation(line: 40, column: 9, scope: !36)
!49 = !DILocation(line: 42, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_10_good", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 99, column: 5, scope: !50)
!52 = !DILocation(line: 100, column: 5, scope: !50)
!53 = !DILocation(line: 101, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 113, type: !55, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 113, type: !57)
!60 = !DILocation(line: 113, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 113, type: !58)
!62 = !DILocation(line: 113, column: 27, scope: !54)
!63 = !DILocation(line: 116, column: 22, scope: !54)
!64 = !DILocation(line: 116, column: 12, scope: !54)
!65 = !DILocation(line: 116, column: 5, scope: !54)
!66 = !DILocation(line: 118, column: 5, scope: !54)
!67 = !DILocation(line: 119, column: 5, scope: !54)
!68 = !DILocation(line: 120, column: 5, scope: !54)
!69 = !DILocation(line: 123, column: 5, scope: !54)
!70 = !DILocation(line: 124, column: 5, scope: !54)
!71 = !DILocation(line: 125, column: 5, scope: !54)
!72 = !DILocation(line: 127, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 51, type: !16)
!75 = !DILocation(line: 51, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !12, line: 52, type: !20)
!77 = !DILocation(line: 52, column: 10, scope: !73)
!78 = !DILocation(line: 53, column: 5, scope: !73)
!79 = !DILocation(line: 54, column: 5, scope: !73)
!80 = !DILocation(line: 54, column: 23, scope: !73)
!81 = !DILocation(line: 55, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !73, file: !12, line: 55, column: 8)
!83 = !DILocation(line: 55, column: 8, scope: !73)
!84 = !DILocation(line: 58, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 56, column: 5)
!86 = !DILocation(line: 59, column: 5, scope: !85)
!87 = !DILocation(line: 63, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !12, line: 61, column: 5)
!89 = !DILocation(line: 63, column: 14, scope: !88)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !12, line: 66, type: !37)
!91 = distinct !DILexicalBlock(scope: !73, file: !12, line: 65, column: 5)
!92 = !DILocation(line: 66, column: 14, scope: !91)
!93 = !DILocation(line: 67, column: 9, scope: !91)
!94 = !DILocation(line: 68, column: 9, scope: !91)
!95 = !DILocation(line: 68, column: 23, scope: !91)
!96 = !DILocation(line: 70, column: 16, scope: !91)
!97 = !DILocation(line: 70, column: 22, scope: !91)
!98 = !DILocation(line: 70, column: 9, scope: !91)
!99 = !DILocation(line: 71, column: 19, scope: !91)
!100 = !DILocation(line: 71, column: 9, scope: !91)
!101 = !DILocation(line: 73, column: 1, scope: !73)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 78, type: !16)
!104 = !DILocation(line: 78, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !12, line: 79, type: !20)
!106 = !DILocation(line: 79, column: 10, scope: !102)
!107 = !DILocation(line: 80, column: 5, scope: !102)
!108 = !DILocation(line: 81, column: 5, scope: !102)
!109 = !DILocation(line: 81, column: 23, scope: !102)
!110 = !DILocation(line: 82, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !102, file: !12, line: 82, column: 8)
!112 = !DILocation(line: 82, column: 8, scope: !102)
!113 = !DILocation(line: 85, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 83, column: 5)
!115 = !DILocation(line: 85, column: 14, scope: !114)
!116 = !DILocation(line: 86, column: 5, scope: !114)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !12, line: 88, type: !37)
!118 = distinct !DILexicalBlock(scope: !102, file: !12, line: 87, column: 5)
!119 = !DILocation(line: 88, column: 14, scope: !118)
!120 = !DILocation(line: 89, column: 9, scope: !118)
!121 = !DILocation(line: 90, column: 9, scope: !118)
!122 = !DILocation(line: 90, column: 23, scope: !118)
!123 = !DILocation(line: 92, column: 16, scope: !118)
!124 = !DILocation(line: 92, column: 22, scope: !118)
!125 = !DILocation(line: 92, column: 9, scope: !118)
!126 = !DILocation(line: 93, column: 19, scope: !118)
!127 = !DILocation(line: 93, column: 9, scope: !118)
!128 = !DILocation(line: 95, column: 1, scope: !102)
