; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %0 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !36
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  %1 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !50
  %call6 = call i8* @strncpy(i8* %arraydecay4, i8* %1, i64 %call) #7, !dbg !51
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx7, align 1, !dbg !53
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @printLine(i8* %arraydecay8), !dbg !55
  ret void, !dbg !56
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
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_05_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #7, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #7, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__char_declare_ncpy_05_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__char_declare_ncpy_05_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !84
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %0 = load i32, i32* @staticFalse, align 4, !dbg !87
  %tobool = icmp ne i32 %0, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !93
  store i8* %arraydecay1, i8** %data, align 8, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx3, align 1, !dbg !101
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !102
  %1 = load i8*, i8** %data, align 8, !dbg !103
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !105
  %call6 = call i8* @strncpy(i8* %arraydecay4, i8* %1, i64 %call) #7, !dbg !106
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx7, align 1, !dbg !108
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  call void @printLine(i8* %arraydecay8), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !117
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %0 = load i32, i32* @staticTrue, align 4, !dbg !120
  %tobool = icmp ne i32 %0, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !123
  store i8* %arraydecay1, i8** %data, align 8, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx3, align 1, !dbg !132
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !133
  %1 = load i8*, i8** %data, align 8, !dbg !134
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !135
  %call = call i64 @strlen(i8* %arraydecay5) #6, !dbg !136
  %call6 = call i8* @strncpy(i8* %arraydecay4, i8* %1, i64 %call) #7, !dbg !137
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !138
  store i8 0, i8* %arrayidx7, align 1, !dbg !139
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @printLine(i8* %arraydecay8), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 33, column: 10, scope: !18)
!30 = !DILocation(line: 34, column: 5, scope: !18)
!31 = !DILocation(line: 35, column: 5, scope: !18)
!32 = !DILocation(line: 35, column: 23, scope: !18)
!33 = !DILocation(line: 36, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !10, line: 36, column: 8)
!35 = !DILocation(line: 36, column: 8, scope: !18)
!36 = !DILocation(line: 39, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 37, column: 5)
!38 = !DILocation(line: 39, column: 27, scope: !37)
!39 = !DILocation(line: 39, column: 14, scope: !37)
!40 = !DILocation(line: 40, column: 5, scope: !37)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !10, line: 42, type: !26)
!42 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!43 = !DILocation(line: 42, column: 14, scope: !42)
!44 = !DILocation(line: 43, column: 9, scope: !42)
!45 = !DILocation(line: 44, column: 9, scope: !42)
!46 = !DILocation(line: 44, column: 21, scope: !42)
!47 = !DILocation(line: 46, column: 17, scope: !42)
!48 = !DILocation(line: 46, column: 23, scope: !42)
!49 = !DILocation(line: 46, column: 36, scope: !42)
!50 = !DILocation(line: 46, column: 29, scope: !42)
!51 = !DILocation(line: 46, column: 9, scope: !42)
!52 = !DILocation(line: 48, column: 9, scope: !42)
!53 = !DILocation(line: 48, column: 21, scope: !42)
!54 = !DILocation(line: 49, column: 19, scope: !42)
!55 = !DILocation(line: 49, column: 9, scope: !42)
!56 = !DILocation(line: 51, column: 1, scope: !18)
!57 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_05_good", scope: !10, file: !10, line: 110, type: !19, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 112, column: 5, scope: !57)
!59 = !DILocation(line: 113, column: 5, scope: !57)
!60 = !DILocation(line: 114, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 126, type: !62, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!11, !11, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !10, line: 126, type: !11)
!66 = !DILocation(line: 126, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !10, line: 126, type: !64)
!68 = !DILocation(line: 126, column: 27, scope: !61)
!69 = !DILocation(line: 129, column: 22, scope: !61)
!70 = !DILocation(line: 129, column: 12, scope: !61)
!71 = !DILocation(line: 129, column: 5, scope: !61)
!72 = !DILocation(line: 131, column: 5, scope: !61)
!73 = !DILocation(line: 132, column: 5, scope: !61)
!74 = !DILocation(line: 133, column: 5, scope: !61)
!75 = !DILocation(line: 136, column: 5, scope: !61)
!76 = !DILocation(line: 137, column: 5, scope: !61)
!77 = !DILocation(line: 138, column: 5, scope: !61)
!78 = !DILocation(line: 140, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !10, line: 60, type: !22)
!81 = !DILocation(line: 60, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !10, line: 61, type: !26)
!83 = !DILocation(line: 61, column: 10, scope: !79)
!84 = !DILocation(line: 62, column: 5, scope: !79)
!85 = !DILocation(line: 63, column: 5, scope: !79)
!86 = !DILocation(line: 63, column: 23, scope: !79)
!87 = !DILocation(line: 64, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !79, file: !10, line: 64, column: 8)
!89 = !DILocation(line: 64, column: 8, scope: !79)
!90 = !DILocation(line: 67, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !10, line: 65, column: 5)
!92 = !DILocation(line: 68, column: 5, scope: !91)
!93 = !DILocation(line: 72, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !10, line: 70, column: 5)
!95 = !DILocation(line: 72, column: 14, scope: !94)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !10, line: 75, type: !26)
!97 = distinct !DILexicalBlock(scope: !79, file: !10, line: 74, column: 5)
!98 = !DILocation(line: 75, column: 14, scope: !97)
!99 = !DILocation(line: 76, column: 9, scope: !97)
!100 = !DILocation(line: 77, column: 9, scope: !97)
!101 = !DILocation(line: 77, column: 21, scope: !97)
!102 = !DILocation(line: 79, column: 17, scope: !97)
!103 = !DILocation(line: 79, column: 23, scope: !97)
!104 = !DILocation(line: 79, column: 36, scope: !97)
!105 = !DILocation(line: 79, column: 29, scope: !97)
!106 = !DILocation(line: 79, column: 9, scope: !97)
!107 = !DILocation(line: 81, column: 9, scope: !97)
!108 = !DILocation(line: 81, column: 21, scope: !97)
!109 = !DILocation(line: 82, column: 19, scope: !97)
!110 = !DILocation(line: 82, column: 9, scope: !97)
!111 = !DILocation(line: 84, column: 1, scope: !79)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !10, line: 89, type: !22)
!114 = !DILocation(line: 89, column: 12, scope: !112)
!115 = !DILocalVariable(name: "dataBuffer", scope: !112, file: !10, line: 90, type: !26)
!116 = !DILocation(line: 90, column: 10, scope: !112)
!117 = !DILocation(line: 91, column: 5, scope: !112)
!118 = !DILocation(line: 92, column: 5, scope: !112)
!119 = !DILocation(line: 92, column: 23, scope: !112)
!120 = !DILocation(line: 93, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !112, file: !10, line: 93, column: 8)
!122 = !DILocation(line: 93, column: 8, scope: !112)
!123 = !DILocation(line: 96, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !10, line: 94, column: 5)
!125 = !DILocation(line: 96, column: 14, scope: !124)
!126 = !DILocation(line: 97, column: 5, scope: !124)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !10, line: 99, type: !26)
!128 = distinct !DILexicalBlock(scope: !112, file: !10, line: 98, column: 5)
!129 = !DILocation(line: 99, column: 14, scope: !128)
!130 = !DILocation(line: 100, column: 9, scope: !128)
!131 = !DILocation(line: 101, column: 9, scope: !128)
!132 = !DILocation(line: 101, column: 21, scope: !128)
!133 = !DILocation(line: 103, column: 17, scope: !128)
!134 = !DILocation(line: 103, column: 23, scope: !128)
!135 = !DILocation(line: 103, column: 36, scope: !128)
!136 = !DILocation(line: 103, column: 29, scope: !128)
!137 = !DILocation(line: 103, column: 9, scope: !128)
!138 = !DILocation(line: 105, column: 9, scope: !128)
!139 = !DILocation(line: 105, column: 21, scope: !128)
!140 = !DILocation(line: 106, column: 19, scope: !128)
!141 = !DILocation(line: 106, column: 9, scope: !128)
!142 = !DILocation(line: 108, column: 1, scope: !112)
