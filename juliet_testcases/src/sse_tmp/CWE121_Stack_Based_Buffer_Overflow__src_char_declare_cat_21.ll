; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_21_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  store i32 1, i32* @badStatic, align 4, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i8* @badSource(i8* %0), !dbg !36
  store i8* %call, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %call2 = call i8* @strcat(i8* %arraydecay1, i8* %2) #5, !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %3), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load i32, i32* @badStatic, align 4, !dbg !55
  %tobool = icmp ne i32 %0, 0, !dbg !55
  br i1 %tobool, label %if.then, label %if.end, !dbg !57

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !60
  %2 = load i8*, i8** %data.addr, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !61
  store i8 0, i8* %arrayidx, align 1, !dbg !62
  br label %if.end, !dbg !63

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !64
  ret i8* %3, !dbg !65
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_21_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_21_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_21_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !93
  store i8* %arraydecay, i8** %data, align 8, !dbg !94
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !95
  %0 = load i8*, i8** %data, align 8, !dbg !96
  %call = call i8* @goodG2B1Source(i8* %0), !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !101
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  %call2 = call i8* @strcat(i8* %arraydecay1, i8* %2) #5, !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* %3), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !108 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !119
  %2 = load i8*, i8** %data.addr, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !122
  ret i8* %3, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !124 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !129
  store i8* %arraydecay, i8** %data, align 8, !dbg !130
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !131
  %0 = load i8*, i8** %data, align 8, !dbg !132
  %call = call i8* @goodG2B2Source(i8* %0), !dbg !133
  store i8* %call, i8** %data, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !135, metadata !DIExpression()), !dbg !137
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !137
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !138
  %2 = load i8*, i8** %data, align 8, !dbg !139
  %call2 = call i8* @strcat(i8* %arraydecay1, i8* %2) #5, !dbg !140
  %3 = load i8*, i8** %data, align 8, !dbg !141
  call void @printLine(i8* %3), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !144 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !147
  %tobool = icmp ne i32 %0, 0, !dbg !147
  br i1 %tobool, label %if.then, label %if.end, !dbg !149

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !152
  %2 = load i8*, i8** %data.addr, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !153
  store i8 0, i8* %arrayidx, align 1, !dbg !154
  br label %if.end, !dbg !155

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !156
  ret i8* %3, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !10, line: 57, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_21.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !10, line: 58, type: !11, isLocal: true, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_21_bad", scope: !10, file: !10, line: 37, type: !21, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 39, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 39, column: 12, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 40, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 40, column: 10, scope: !20)
!32 = !DILocation(line: 41, column: 12, scope: !20)
!33 = !DILocation(line: 41, column: 10, scope: !20)
!34 = !DILocation(line: 42, column: 15, scope: !20)
!35 = !DILocation(line: 43, column: 22, scope: !20)
!36 = !DILocation(line: 43, column: 12, scope: !20)
!37 = !DILocation(line: 43, column: 10, scope: !20)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 45, type: !40)
!39 = distinct !DILexicalBlock(scope: !20, file: !10, line: 44, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 45, column: 14, scope: !39)
!44 = !DILocation(line: 47, column: 16, scope: !39)
!45 = !DILocation(line: 47, column: 22, scope: !39)
!46 = !DILocation(line: 47, column: 9, scope: !39)
!47 = !DILocation(line: 48, column: 19, scope: !39)
!48 = !DILocation(line: 48, column: 9, scope: !39)
!49 = !DILocation(line: 50, column: 1, scope: !20)
!50 = distinct !DISubprogram(name: "badSource", scope: !10, file: !10, line: 26, type: !51, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!24, !24}
!53 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !10, line: 26, type: !24)
!54 = !DILocation(line: 26, column: 32, scope: !50)
!55 = !DILocation(line: 28, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !10, line: 28, column: 8)
!57 = !DILocation(line: 28, column: 8, scope: !50)
!58 = !DILocation(line: 31, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !10, line: 29, column: 5)
!60 = !DILocation(line: 31, column: 9, scope: !59)
!61 = !DILocation(line: 32, column: 9, scope: !59)
!62 = !DILocation(line: 32, column: 21, scope: !59)
!63 = !DILocation(line: 33, column: 5, scope: !59)
!64 = !DILocation(line: 34, column: 12, scope: !50)
!65 = !DILocation(line: 34, column: 5, scope: !50)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_21_good", scope: !10, file: !10, line: 119, type: !21, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 121, column: 5, scope: !66)
!68 = !DILocation(line: 122, column: 5, scope: !66)
!69 = !DILocation(line: 123, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 135, type: !71, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!11, !11, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !10, line: 135, type: !11)
!75 = !DILocation(line: 135, column: 14, scope: !70)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !10, line: 135, type: !73)
!77 = !DILocation(line: 135, column: 27, scope: !70)
!78 = !DILocation(line: 138, column: 22, scope: !70)
!79 = !DILocation(line: 138, column: 12, scope: !70)
!80 = !DILocation(line: 138, column: 5, scope: !70)
!81 = !DILocation(line: 140, column: 5, scope: !70)
!82 = !DILocation(line: 141, column: 5, scope: !70)
!83 = !DILocation(line: 142, column: 5, scope: !70)
!84 = !DILocation(line: 145, column: 5, scope: !70)
!85 = !DILocation(line: 146, column: 5, scope: !70)
!86 = !DILocation(line: 147, column: 5, scope: !70)
!87 = !DILocation(line: 149, column: 5, scope: !70)
!88 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 77, type: !21, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocalVariable(name: "data", scope: !88, file: !10, line: 79, type: !24)
!90 = !DILocation(line: 79, column: 12, scope: !88)
!91 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !10, line: 80, type: !28)
!92 = !DILocation(line: 80, column: 10, scope: !88)
!93 = !DILocation(line: 81, column: 12, scope: !88)
!94 = !DILocation(line: 81, column: 10, scope: !88)
!95 = !DILocation(line: 82, column: 20, scope: !88)
!96 = !DILocation(line: 83, column: 27, scope: !88)
!97 = !DILocation(line: 83, column: 12, scope: !88)
!98 = !DILocation(line: 83, column: 10, scope: !88)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !10, line: 85, type: !40)
!100 = distinct !DILexicalBlock(scope: !88, file: !10, line: 84, column: 5)
!101 = !DILocation(line: 85, column: 14, scope: !100)
!102 = !DILocation(line: 87, column: 16, scope: !100)
!103 = !DILocation(line: 87, column: 22, scope: !100)
!104 = !DILocation(line: 87, column: 9, scope: !100)
!105 = !DILocation(line: 88, column: 19, scope: !100)
!106 = !DILocation(line: 88, column: 9, scope: !100)
!107 = !DILocation(line: 90, column: 1, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B1Source", scope: !10, file: !10, line: 61, type: !51, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", arg: 1, scope: !108, file: !10, line: 61, type: !24)
!110 = !DILocation(line: 61, column: 37, scope: !108)
!111 = !DILocation(line: 63, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !10, line: 63, column: 8)
!113 = !DILocation(line: 63, column: 8, scope: !108)
!114 = !DILocation(line: 66, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !10, line: 64, column: 5)
!116 = !DILocation(line: 67, column: 5, scope: !115)
!117 = !DILocation(line: 71, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !10, line: 69, column: 5)
!119 = !DILocation(line: 71, column: 9, scope: !118)
!120 = !DILocation(line: 72, column: 9, scope: !118)
!121 = !DILocation(line: 72, column: 20, scope: !118)
!122 = !DILocation(line: 74, column: 12, scope: !108)
!123 = !DILocation(line: 74, column: 5, scope: !108)
!124 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 104, type: !21, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!125 = !DILocalVariable(name: "data", scope: !124, file: !10, line: 106, type: !24)
!126 = !DILocation(line: 106, column: 12, scope: !124)
!127 = !DILocalVariable(name: "dataBuffer", scope: !124, file: !10, line: 107, type: !28)
!128 = !DILocation(line: 107, column: 10, scope: !124)
!129 = !DILocation(line: 108, column: 12, scope: !124)
!130 = !DILocation(line: 108, column: 10, scope: !124)
!131 = !DILocation(line: 109, column: 20, scope: !124)
!132 = !DILocation(line: 110, column: 27, scope: !124)
!133 = !DILocation(line: 110, column: 12, scope: !124)
!134 = !DILocation(line: 110, column: 10, scope: !124)
!135 = !DILocalVariable(name: "dest", scope: !136, file: !10, line: 112, type: !40)
!136 = distinct !DILexicalBlock(scope: !124, file: !10, line: 111, column: 5)
!137 = !DILocation(line: 112, column: 14, scope: !136)
!138 = !DILocation(line: 114, column: 16, scope: !136)
!139 = !DILocation(line: 114, column: 22, scope: !136)
!140 = !DILocation(line: 114, column: 9, scope: !136)
!141 = !DILocation(line: 115, column: 19, scope: !136)
!142 = !DILocation(line: 115, column: 9, scope: !136)
!143 = !DILocation(line: 117, column: 1, scope: !124)
!144 = distinct !DISubprogram(name: "goodG2B2Source", scope: !10, file: !10, line: 93, type: !51, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocalVariable(name: "data", arg: 1, scope: !144, file: !10, line: 93, type: !24)
!146 = !DILocation(line: 93, column: 37, scope: !144)
!147 = !DILocation(line: 95, column: 8, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !10, line: 95, column: 8)
!149 = !DILocation(line: 95, column: 8, scope: !144)
!150 = !DILocation(line: 98, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !10, line: 96, column: 5)
!152 = !DILocation(line: 98, column: 9, scope: !151)
!153 = !DILocation(line: 99, column: 9, scope: !151)
!154 = !DILocation(line: 99, column: 20, scope: !151)
!155 = !DILocation(line: 100, column: 5, scope: !151)
!156 = !DILocation(line: 101, column: 12, scope: !144)
!157 = !DILocation(line: 101, column: 5, scope: !144)
