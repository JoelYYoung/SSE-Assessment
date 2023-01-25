; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 10, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 11, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %2, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !34
  store i8* %3, i8** %data, align 8, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !49
  %add = add i64 %call, 1, !dbg !50
  %call2 = call i8* @strncpy(i8* %6, i8* %arraydecay, i64 %add) #7, !dbg !51
  %7 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %7), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 10, align 16, !dbg !82
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %1 = alloca i8, i64 11, align 16, !dbg !85
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !84
  %2 = load i32, i32* @staticFalse, align 4, !dbg !86
  %tobool = icmp ne i32 %2, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !92
  store i8* %3, i8** %data, align 8, !dbg !94
  %4 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !99
  %6 = load i8*, i8** %data, align 8, !dbg !100
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !101
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !102
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !103
  %add = add i64 %call, 1, !dbg !104
  %call2 = call i8* @strncpy(i8* %6, i8* %arraydecay, i64 %add) #7, !dbg !105
  %7 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %7), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 10, align 16, !dbg !114
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %1 = alloca i8, i64 11, align 16, !dbg !117
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !116
  %2 = load i32, i32* @staticTrue, align 4, !dbg !118
  %tobool = icmp ne i32 %2, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !121
  store i8* %3, i8** %data, align 8, !dbg !123
  %4 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !129
  %6 = load i8*, i8** %data, align 8, !dbg !130
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !131
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !132
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !133
  %add = add i64 %call, 1, !dbg !134
  %call2 = call i8* @strncpy(i8* %6, i8* %arraydecay, i64 %add) #7, !dbg !135
  %7 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* %7), !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 30, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 31, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05_bad", scope: !12, file: !12, line: 35, type: !21, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 37, type: !6)
!24 = !DILocation(line: 37, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !20, file: !12, line: 38, type: !6)
!26 = !DILocation(line: 38, column: 12, scope: !20)
!27 = !DILocation(line: 38, column: 36, scope: !20)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !20, file: !12, line: 39, type: !6)
!29 = !DILocation(line: 39, column: 12, scope: !20)
!30 = !DILocation(line: 39, column: 37, scope: !20)
!31 = !DILocation(line: 40, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !20, file: !12, line: 40, column: 8)
!33 = !DILocation(line: 40, column: 8, scope: !20)
!34 = !DILocation(line: 44, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 41, column: 5)
!36 = !DILocation(line: 44, column: 14, scope: !35)
!37 = !DILocation(line: 45, column: 9, scope: !35)
!38 = !DILocation(line: 45, column: 17, scope: !35)
!39 = !DILocation(line: 46, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 48, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !12, line: 47, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 48, column: 14, scope: !41)
!46 = !DILocation(line: 51, column: 17, scope: !41)
!47 = !DILocation(line: 51, column: 23, scope: !41)
!48 = !DILocation(line: 51, column: 38, scope: !41)
!49 = !DILocation(line: 51, column: 31, scope: !41)
!50 = !DILocation(line: 51, column: 46, scope: !41)
!51 = !DILocation(line: 51, column: 9, scope: !41)
!52 = !DILocation(line: 52, column: 19, scope: !41)
!53 = !DILocation(line: 52, column: 9, scope: !41)
!54 = !DILocation(line: 54, column: 1, scope: !20)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_ncpy_05_good", scope: !12, file: !12, line: 109, type: !21, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 111, column: 5, scope: !55)
!57 = !DILocation(line: 112, column: 5, scope: !55)
!58 = !DILocation(line: 113, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 125, type: !60, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!13, !13, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 125, type: !13)
!64 = !DILocation(line: 125, column: 14, scope: !59)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 125, type: !62)
!66 = !DILocation(line: 125, column: 27, scope: !59)
!67 = !DILocation(line: 128, column: 22, scope: !59)
!68 = !DILocation(line: 128, column: 12, scope: !59)
!69 = !DILocation(line: 128, column: 5, scope: !59)
!70 = !DILocation(line: 130, column: 5, scope: !59)
!71 = !DILocation(line: 131, column: 5, scope: !59)
!72 = !DILocation(line: 132, column: 5, scope: !59)
!73 = !DILocation(line: 135, column: 5, scope: !59)
!74 = !DILocation(line: 136, column: 5, scope: !59)
!75 = !DILocation(line: 137, column: 5, scope: !59)
!76 = !DILocation(line: 139, column: 5, scope: !59)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 63, type: !6)
!79 = !DILocation(line: 63, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !12, line: 64, type: !6)
!81 = !DILocation(line: 64, column: 12, scope: !77)
!82 = !DILocation(line: 64, column: 36, scope: !77)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !12, line: 65, type: !6)
!84 = !DILocation(line: 65, column: 12, scope: !77)
!85 = !DILocation(line: 65, column: 37, scope: !77)
!86 = !DILocation(line: 66, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !12, line: 66, column: 8)
!88 = !DILocation(line: 66, column: 8, scope: !77)
!89 = !DILocation(line: 69, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !12, line: 67, column: 5)
!91 = !DILocation(line: 70, column: 5, scope: !90)
!92 = !DILocation(line: 75, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !12, line: 72, column: 5)
!94 = !DILocation(line: 75, column: 14, scope: !93)
!95 = !DILocation(line: 76, column: 9, scope: !93)
!96 = !DILocation(line: 76, column: 17, scope: !93)
!97 = !DILocalVariable(name: "source", scope: !98, file: !12, line: 79, type: !42)
!98 = distinct !DILexicalBlock(scope: !77, file: !12, line: 78, column: 5)
!99 = !DILocation(line: 79, column: 14, scope: !98)
!100 = !DILocation(line: 82, column: 17, scope: !98)
!101 = !DILocation(line: 82, column: 23, scope: !98)
!102 = !DILocation(line: 82, column: 38, scope: !98)
!103 = !DILocation(line: 82, column: 31, scope: !98)
!104 = !DILocation(line: 82, column: 46, scope: !98)
!105 = !DILocation(line: 82, column: 9, scope: !98)
!106 = !DILocation(line: 83, column: 19, scope: !98)
!107 = !DILocation(line: 83, column: 9, scope: !98)
!108 = !DILocation(line: 85, column: 1, scope: !77)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !21, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 90, type: !6)
!111 = !DILocation(line: 90, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !12, line: 91, type: !6)
!113 = !DILocation(line: 91, column: 12, scope: !109)
!114 = !DILocation(line: 91, column: 36, scope: !109)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !12, line: 92, type: !6)
!116 = !DILocation(line: 92, column: 12, scope: !109)
!117 = !DILocation(line: 92, column: 37, scope: !109)
!118 = !DILocation(line: 93, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !109, file: !12, line: 93, column: 8)
!120 = !DILocation(line: 93, column: 8, scope: !109)
!121 = !DILocation(line: 97, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 94, column: 5)
!123 = !DILocation(line: 97, column: 14, scope: !122)
!124 = !DILocation(line: 98, column: 9, scope: !122)
!125 = !DILocation(line: 98, column: 17, scope: !122)
!126 = !DILocation(line: 99, column: 5, scope: !122)
!127 = !DILocalVariable(name: "source", scope: !128, file: !12, line: 101, type: !42)
!128 = distinct !DILexicalBlock(scope: !109, file: !12, line: 100, column: 5)
!129 = !DILocation(line: 101, column: 14, scope: !128)
!130 = !DILocation(line: 104, column: 17, scope: !128)
!131 = !DILocation(line: 104, column: 23, scope: !128)
!132 = !DILocation(line: 104, column: 38, scope: !128)
!133 = !DILocation(line: 104, column: 31, scope: !128)
!134 = !DILocation(line: 104, column: 46, scope: !128)
!135 = !DILocation(line: 104, column: 9, scope: !128)
!136 = !DILocation(line: 105, column: 19, scope: !128)
!137 = !DILocation(line: 105, column: 9, scope: !128)
!138 = !DILocation(line: 107, column: 1, scope: !109)
