; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !10
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_21_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %0, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  store i8* %1, i8** %data, align 8, !dbg !31
  store i32 1, i32* @badStatic, align 4, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %call = call i8* @badSource(i8* %2), !dbg !34
  store i8* %call, i8** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %6), !dbg !48
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
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_21_good() #0 !dbg !66 {
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
  %call = call i64 @time(i64* null) #7, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #7, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_21_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_21_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
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
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 100, align 16, !dbg !93
  store i8* %0, i8** %dataBuffer, align 8, !dbg !92
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  store i8* %1, i8** %data, align 8, !dbg !95
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !96
  %2 = load i8*, i8** %data, align 8, !dbg !97
  %call = call i8* @goodG2B1Source(i8* %2), !dbg !98
  store i8* %call, i8** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !103
  %4 = load i8*, i8** %data, align 8, !dbg !104
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !105
  %5 = load i8*, i8** %data, align 8, !dbg !106
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !107
  %6 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %6), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B1Source(i8* %data) #0 !dbg !111 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !114
  %tobool = icmp ne i32 %0, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !117
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !122
  %2 = load i8*, i8** %data.addr, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i8*, i8** %data.addr, align 8, !dbg !125
  ret i8* %3, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !127 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = alloca i8, i64 100, align 16, !dbg !132
  store i8* %0, i8** %dataBuffer, align 8, !dbg !131
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !133
  store i8* %1, i8** %data, align 8, !dbg !134
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !135
  %2 = load i8*, i8** %data, align 8, !dbg !136
  %call = call i8* @goodG2B2Source(i8* %2), !dbg !137
  store i8* %call, i8** %data, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !139, metadata !DIExpression()), !dbg !141
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !141
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !142
  %4 = load i8*, i8** %data, align 8, !dbg !143
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !144
  %5 = load i8*, i8** %data, align 8, !dbg !145
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !146
  %6 = load i8*, i8** %data, align 8, !dbg !147
  call void @printLine(i8* %6), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2B2Source(i8* %data) #0 !dbg !150 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !151, metadata !DIExpression()), !dbg !152
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !153
  %tobool = icmp ne i32 %0, 0, !dbg !153
  br i1 %tobool, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !158
  %2 = load i8*, i8** %data.addr, align 8, !dbg !159
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !159
  store i8 0, i8* %arrayidx, align 1, !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %data.addr, align 8, !dbg !162
  ret i8* %3, !dbg !163
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
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !12, line: 30, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !12, line: 63, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_21.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !12, line: 64, type: !13, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_21_bad", scope: !12, file: !12, line: 43, type: !23, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 45, type: !6)
!26 = !DILocation(line: 45, column: 12, scope: !22)
!27 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !12, line: 46, type: !6)
!28 = !DILocation(line: 46, column: 12, scope: !22)
!29 = !DILocation(line: 46, column: 33, scope: !22)
!30 = !DILocation(line: 47, column: 12, scope: !22)
!31 = !DILocation(line: 47, column: 10, scope: !22)
!32 = !DILocation(line: 48, column: 15, scope: !22)
!33 = !DILocation(line: 49, column: 22, scope: !22)
!34 = !DILocation(line: 49, column: 12, scope: !22)
!35 = !DILocation(line: 49, column: 10, scope: !22)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 51, type: !38)
!37 = distinct !DILexicalBlock(scope: !22, file: !12, line: 50, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 51, column: 14, scope: !37)
!42 = !DILocation(line: 53, column: 18, scope: !37)
!43 = !DILocation(line: 53, column: 31, scope: !37)
!44 = !DILocation(line: 53, column: 24, scope: !37)
!45 = !DILocation(line: 53, column: 44, scope: !37)
!46 = !DILocation(line: 53, column: 9, scope: !37)
!47 = !DILocation(line: 54, column: 19, scope: !37)
!48 = !DILocation(line: 54, column: 9, scope: !37)
!49 = !DILocation(line: 56, column: 1, scope: !22)
!50 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 32, type: !51, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!6, !6}
!53 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !12, line: 32, type: !6)
!54 = !DILocation(line: 32, column: 32, scope: !50)
!55 = !DILocation(line: 34, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !12, line: 34, column: 8)
!57 = !DILocation(line: 34, column: 8, scope: !50)
!58 = !DILocation(line: 37, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 35, column: 5)
!60 = !DILocation(line: 37, column: 9, scope: !59)
!61 = !DILocation(line: 38, column: 9, scope: !59)
!62 = !DILocation(line: 38, column: 21, scope: !59)
!63 = !DILocation(line: 39, column: 5, scope: !59)
!64 = !DILocation(line: 40, column: 12, scope: !50)
!65 = !DILocation(line: 40, column: 5, scope: !50)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_21_good", scope: !12, file: !12, line: 125, type: !23, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 127, column: 5, scope: !66)
!68 = !DILocation(line: 128, column: 5, scope: !66)
!69 = !DILocation(line: 129, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 141, type: !71, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!13, !13, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !12, line: 141, type: !13)
!75 = !DILocation(line: 141, column: 14, scope: !70)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !12, line: 141, type: !73)
!77 = !DILocation(line: 141, column: 27, scope: !70)
!78 = !DILocation(line: 144, column: 22, scope: !70)
!79 = !DILocation(line: 144, column: 12, scope: !70)
!80 = !DILocation(line: 144, column: 5, scope: !70)
!81 = !DILocation(line: 146, column: 5, scope: !70)
!82 = !DILocation(line: 147, column: 5, scope: !70)
!83 = !DILocation(line: 148, column: 5, scope: !70)
!84 = !DILocation(line: 151, column: 5, scope: !70)
!85 = !DILocation(line: 152, column: 5, scope: !70)
!86 = !DILocation(line: 153, column: 5, scope: !70)
!87 = !DILocation(line: 155, column: 5, scope: !70)
!88 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 83, type: !23, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 85, type: !6)
!90 = !DILocation(line: 85, column: 12, scope: !88)
!91 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !12, line: 86, type: !6)
!92 = !DILocation(line: 86, column: 12, scope: !88)
!93 = !DILocation(line: 86, column: 33, scope: !88)
!94 = !DILocation(line: 87, column: 12, scope: !88)
!95 = !DILocation(line: 87, column: 10, scope: !88)
!96 = !DILocation(line: 88, column: 20, scope: !88)
!97 = !DILocation(line: 89, column: 27, scope: !88)
!98 = !DILocation(line: 89, column: 12, scope: !88)
!99 = !DILocation(line: 89, column: 10, scope: !88)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !12, line: 91, type: !38)
!101 = distinct !DILexicalBlock(scope: !88, file: !12, line: 90, column: 5)
!102 = !DILocation(line: 91, column: 14, scope: !101)
!103 = !DILocation(line: 93, column: 18, scope: !101)
!104 = !DILocation(line: 93, column: 31, scope: !101)
!105 = !DILocation(line: 93, column: 24, scope: !101)
!106 = !DILocation(line: 93, column: 44, scope: !101)
!107 = !DILocation(line: 93, column: 9, scope: !101)
!108 = !DILocation(line: 94, column: 19, scope: !101)
!109 = !DILocation(line: 94, column: 9, scope: !101)
!110 = !DILocation(line: 96, column: 1, scope: !88)
!111 = distinct !DISubprogram(name: "goodG2B1Source", scope: !12, file: !12, line: 67, type: !51, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", arg: 1, scope: !111, file: !12, line: 67, type: !6)
!113 = !DILocation(line: 67, column: 37, scope: !111)
!114 = !DILocation(line: 69, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !12, line: 69, column: 8)
!116 = !DILocation(line: 69, column: 8, scope: !111)
!117 = !DILocation(line: 72, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 70, column: 5)
!119 = !DILocation(line: 73, column: 5, scope: !118)
!120 = !DILocation(line: 77, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !12, line: 75, column: 5)
!122 = !DILocation(line: 77, column: 9, scope: !121)
!123 = !DILocation(line: 78, column: 9, scope: !121)
!124 = !DILocation(line: 78, column: 20, scope: !121)
!125 = !DILocation(line: 80, column: 12, scope: !111)
!126 = !DILocation(line: 80, column: 5, scope: !111)
!127 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 110, type: !23, scopeLine: 111, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!128 = !DILocalVariable(name: "data", scope: !127, file: !12, line: 112, type: !6)
!129 = !DILocation(line: 112, column: 12, scope: !127)
!130 = !DILocalVariable(name: "dataBuffer", scope: !127, file: !12, line: 113, type: !6)
!131 = !DILocation(line: 113, column: 12, scope: !127)
!132 = !DILocation(line: 113, column: 33, scope: !127)
!133 = !DILocation(line: 114, column: 12, scope: !127)
!134 = !DILocation(line: 114, column: 10, scope: !127)
!135 = !DILocation(line: 115, column: 20, scope: !127)
!136 = !DILocation(line: 116, column: 27, scope: !127)
!137 = !DILocation(line: 116, column: 12, scope: !127)
!138 = !DILocation(line: 116, column: 10, scope: !127)
!139 = !DILocalVariable(name: "dest", scope: !140, file: !12, line: 118, type: !38)
!140 = distinct !DILexicalBlock(scope: !127, file: !12, line: 117, column: 5)
!141 = !DILocation(line: 118, column: 14, scope: !140)
!142 = !DILocation(line: 120, column: 18, scope: !140)
!143 = !DILocation(line: 120, column: 31, scope: !140)
!144 = !DILocation(line: 120, column: 24, scope: !140)
!145 = !DILocation(line: 120, column: 44, scope: !140)
!146 = !DILocation(line: 120, column: 9, scope: !140)
!147 = !DILocation(line: 121, column: 19, scope: !140)
!148 = !DILocation(line: 121, column: 9, scope: !140)
!149 = !DILocation(line: 123, column: 1, scope: !127)
!150 = distinct !DISubprogram(name: "goodG2B2Source", scope: !12, file: !12, line: 99, type: !51, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "data", arg: 1, scope: !150, file: !12, line: 99, type: !6)
!152 = !DILocation(line: 99, column: 37, scope: !150)
!153 = !DILocation(line: 101, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !12, line: 101, column: 8)
!155 = !DILocation(line: 101, column: 8, scope: !150)
!156 = !DILocation(line: 104, column: 16, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !12, line: 102, column: 5)
!158 = !DILocation(line: 104, column: 9, scope: !157)
!159 = !DILocation(line: 105, column: 9, scope: !157)
!160 = !DILocation(line: 105, column: 20, scope: !157)
!161 = !DILocation(line: 106, column: 5, scope: !157)
!162 = !DILocation(line: 107, column: 12, scope: !150)
!163 = !DILocation(line: 107, column: 5, scope: !150)
