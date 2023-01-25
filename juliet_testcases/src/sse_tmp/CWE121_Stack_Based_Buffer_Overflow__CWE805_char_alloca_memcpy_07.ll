; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 50, align 16, !dbg !25
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = alloca i8, i64 100, align 16, !dbg !28
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !27
  %2 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp = icmp eq i32 %2, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %3, i8** %data, align 8, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx1, align 1, !dbg !47
  %5 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !49
  %6 = load i8*, i8** %data, align 8, !dbg !50
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !50
  store i8 0, i8* %arrayidx3, align 1, !dbg !51
  %7 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %7), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_07_good() #0 !dbg !55 {
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
  %call = call i64 @time(i64* null) #6, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #6, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_07_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_07_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 50, align 16, !dbg !82
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %1 = alloca i8, i64 100, align 16, !dbg !85
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !84
  %2 = load i32, i32* @staticFive, align 4, !dbg !86
  %cmp = icmp ne i32 %2, 5, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !93
  store i8* %3, i8** %data, align 8, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx1, align 1, !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !105
  %6 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !106
  store i8 0, i8* %arrayidx3, align 1, !dbg !107
  %7 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %7), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 50, align 16, !dbg !116
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %1 = alloca i8, i64 100, align 16, !dbg !119
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !118
  %2 = load i32, i32* @staticFive, align 4, !dbg !120
  %cmp = icmp eq i32 %2, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !124
  store i8* %3, i8** %data, align 8, !dbg !126
  %4 = load i8*, i8** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !133
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !134
  store i8 0, i8* %arrayidx1, align 1, !dbg !135
  %5 = load i8*, i8** %data, align 8, !dbg !136
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !137
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !137
  %6 = load i8*, i8** %data, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !138
  store i8 0, i8* %arrayidx3, align 1, !dbg !139
  %7 = load i8*, i8** %data, align 8, !dbg !140
  call void @printLine(i8* %7), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_07_bad", scope: !10, file: !10, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 31, type: !6)
!22 = !DILocation(line: 31, column: 12, scope: !18)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocation(line: 32, column: 36, scope: !18)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 12, scope: !18)
!28 = !DILocation(line: 33, column: 37, scope: !18)
!29 = !DILocation(line: 34, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !10, line: 34, column: 8)
!31 = !DILocation(line: 34, column: 18, scope: !30)
!32 = !DILocation(line: 34, column: 8, scope: !18)
!33 = !DILocation(line: 38, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 35, column: 5)
!35 = !DILocation(line: 38, column: 14, scope: !34)
!36 = !DILocation(line: 39, column: 9, scope: !34)
!37 = !DILocation(line: 39, column: 17, scope: !34)
!38 = !DILocation(line: 40, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !10, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 42, column: 14, scope: !40)
!45 = !DILocation(line: 43, column: 9, scope: !40)
!46 = !DILocation(line: 44, column: 9, scope: !40)
!47 = !DILocation(line: 44, column: 23, scope: !40)
!48 = !DILocation(line: 46, column: 16, scope: !40)
!49 = !DILocation(line: 46, column: 9, scope: !40)
!50 = !DILocation(line: 47, column: 9, scope: !40)
!51 = !DILocation(line: 47, column: 21, scope: !40)
!52 = !DILocation(line: 48, column: 19, scope: !40)
!53 = !DILocation(line: 48, column: 9, scope: !40)
!54 = !DILocation(line: 50, column: 1, scope: !18)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_07_good", scope: !10, file: !10, line: 107, type: !19, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 109, column: 5, scope: !55)
!57 = !DILocation(line: 110, column: 5, scope: !55)
!58 = !DILocation(line: 111, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 123, type: !60, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!11, !11, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !10, line: 123, type: !11)
!64 = !DILocation(line: 123, column: 14, scope: !59)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !10, line: 123, type: !62)
!66 = !DILocation(line: 123, column: 27, scope: !59)
!67 = !DILocation(line: 126, column: 22, scope: !59)
!68 = !DILocation(line: 126, column: 12, scope: !59)
!69 = !DILocation(line: 126, column: 5, scope: !59)
!70 = !DILocation(line: 128, column: 5, scope: !59)
!71 = !DILocation(line: 129, column: 5, scope: !59)
!72 = !DILocation(line: 130, column: 5, scope: !59)
!73 = !DILocation(line: 133, column: 5, scope: !59)
!74 = !DILocation(line: 134, column: 5, scope: !59)
!75 = !DILocation(line: 135, column: 5, scope: !59)
!76 = !DILocation(line: 137, column: 5, scope: !59)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 57, type: !19, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !10, line: 59, type: !6)
!79 = !DILocation(line: 59, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !10, line: 60, type: !6)
!81 = !DILocation(line: 60, column: 12, scope: !77)
!82 = !DILocation(line: 60, column: 36, scope: !77)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !10, line: 61, type: !6)
!84 = !DILocation(line: 61, column: 12, scope: !77)
!85 = !DILocation(line: 61, column: 37, scope: !77)
!86 = !DILocation(line: 62, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !10, line: 62, column: 8)
!88 = !DILocation(line: 62, column: 18, scope: !87)
!89 = !DILocation(line: 62, column: 8, scope: !77)
!90 = !DILocation(line: 65, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !10, line: 63, column: 5)
!92 = !DILocation(line: 66, column: 5, scope: !91)
!93 = !DILocation(line: 70, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !10, line: 68, column: 5)
!95 = !DILocation(line: 70, column: 14, scope: !94)
!96 = !DILocation(line: 71, column: 9, scope: !94)
!97 = !DILocation(line: 71, column: 17, scope: !94)
!98 = !DILocalVariable(name: "source", scope: !99, file: !10, line: 74, type: !41)
!99 = distinct !DILexicalBlock(scope: !77, file: !10, line: 73, column: 5)
!100 = !DILocation(line: 74, column: 14, scope: !99)
!101 = !DILocation(line: 75, column: 9, scope: !99)
!102 = !DILocation(line: 76, column: 9, scope: !99)
!103 = !DILocation(line: 76, column: 23, scope: !99)
!104 = !DILocation(line: 78, column: 16, scope: !99)
!105 = !DILocation(line: 78, column: 9, scope: !99)
!106 = !DILocation(line: 79, column: 9, scope: !99)
!107 = !DILocation(line: 79, column: 21, scope: !99)
!108 = !DILocation(line: 80, column: 19, scope: !99)
!109 = !DILocation(line: 80, column: 9, scope: !99)
!110 = !DILocation(line: 82, column: 1, scope: !77)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 85, type: !19, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !10, line: 87, type: !6)
!113 = !DILocation(line: 87, column: 12, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !10, line: 88, type: !6)
!115 = !DILocation(line: 88, column: 12, scope: !111)
!116 = !DILocation(line: 88, column: 36, scope: !111)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !10, line: 89, type: !6)
!118 = !DILocation(line: 89, column: 12, scope: !111)
!119 = !DILocation(line: 89, column: 37, scope: !111)
!120 = !DILocation(line: 90, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !10, line: 90, column: 8)
!122 = !DILocation(line: 90, column: 18, scope: !121)
!123 = !DILocation(line: 90, column: 8, scope: !111)
!124 = !DILocation(line: 93, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !10, line: 91, column: 5)
!126 = !DILocation(line: 93, column: 14, scope: !125)
!127 = !DILocation(line: 94, column: 9, scope: !125)
!128 = !DILocation(line: 94, column: 17, scope: !125)
!129 = !DILocation(line: 95, column: 5, scope: !125)
!130 = !DILocalVariable(name: "source", scope: !131, file: !10, line: 97, type: !41)
!131 = distinct !DILexicalBlock(scope: !111, file: !10, line: 96, column: 5)
!132 = !DILocation(line: 97, column: 14, scope: !131)
!133 = !DILocation(line: 98, column: 9, scope: !131)
!134 = !DILocation(line: 99, column: 9, scope: !131)
!135 = !DILocation(line: 99, column: 23, scope: !131)
!136 = !DILocation(line: 101, column: 16, scope: !131)
!137 = !DILocation(line: 101, column: 9, scope: !131)
!138 = !DILocation(line: 102, column: 9, scope: !131)
!139 = !DILocation(line: 102, column: 21, scope: !131)
!140 = !DILocation(line: 103, column: 19, scope: !131)
!141 = !DILocation(line: 103, column: 9, scope: !131)
!142 = !DILocation(line: 105, column: 1, scope: !111)
