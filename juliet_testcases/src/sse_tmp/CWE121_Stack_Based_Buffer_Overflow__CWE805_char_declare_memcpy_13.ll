; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx2, align 1, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !47
  store i8 0, i8* %arrayidx4, align 1, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %4), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_13_good() #0 !dbg !52 {
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
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_13_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_13_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !82
  %cmp = icmp ne i32 %0, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !89
  store i8* %arraydecay, i8** %data, align 8, !dbg !91
  %1 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !97
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx2, align 1, !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !101
  %3 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !102
  store i8 0, i8* %arrayidx4, align 1, !dbg !103
  %4 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* %4), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !114
  %cmp = icmp eq i32 %0, 5, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !118
  store i8* %arraydecay, i8** %data, align 8, !dbg !120
  %1 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !127
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx2, align 1, !dbg !129
  %2 = load i8*, i8** %data, align 8, !dbg !130
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !131
  %3 = load i8*, i8** %data, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !132
  store i8 0, i8* %arrayidx4, align 1, !dbg !133
  %4 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %4), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_13_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_13.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 25, scope: !30)
!32 = !DILocation(line: 28, column: 8, scope: !11)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 29, column: 5)
!35 = !DILocation(line: 32, column: 14, scope: !34)
!36 = !DILocation(line: 33, column: 9, scope: !34)
!37 = !DILocation(line: 33, column: 17, scope: !34)
!38 = !DILocation(line: 34, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 36, type: !25)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!41 = !DILocation(line: 36, column: 14, scope: !40)
!42 = !DILocation(line: 37, column: 9, scope: !40)
!43 = !DILocation(line: 38, column: 9, scope: !40)
!44 = !DILocation(line: 38, column: 23, scope: !40)
!45 = !DILocation(line: 40, column: 16, scope: !40)
!46 = !DILocation(line: 40, column: 9, scope: !40)
!47 = !DILocation(line: 41, column: 9, scope: !40)
!48 = !DILocation(line: 41, column: 21, scope: !40)
!49 = !DILocation(line: 42, column: 19, scope: !40)
!50 = !DILocation(line: 42, column: 9, scope: !40)
!51 = !DILocation(line: 44, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_13_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 103, column: 5, scope: !52)
!54 = !DILocation(line: 104, column: 5, scope: !52)
!55 = !DILocation(line: 105, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !57, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 117, type: !59)
!62 = !DILocation(line: 117, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 117, type: !60)
!64 = !DILocation(line: 117, column: 27, scope: !56)
!65 = !DILocation(line: 120, column: 22, scope: !56)
!66 = !DILocation(line: 120, column: 12, scope: !56)
!67 = !DILocation(line: 120, column: 5, scope: !56)
!68 = !DILocation(line: 122, column: 5, scope: !56)
!69 = !DILocation(line: 123, column: 5, scope: !56)
!70 = !DILocation(line: 124, column: 5, scope: !56)
!71 = !DILocation(line: 127, column: 5, scope: !56)
!72 = !DILocation(line: 128, column: 5, scope: !56)
!73 = !DILocation(line: 129, column: 5, scope: !56)
!74 = !DILocation(line: 131, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 53, type: !16)
!77 = !DILocation(line: 53, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !12, line: 54, type: !20)
!79 = !DILocation(line: 54, column: 10, scope: !75)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !12, line: 55, type: !25)
!81 = !DILocation(line: 55, column: 10, scope: !75)
!82 = !DILocation(line: 56, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !75, file: !12, line: 56, column: 8)
!84 = !DILocation(line: 56, column: 25, scope: !83)
!85 = !DILocation(line: 56, column: 8, scope: !75)
!86 = !DILocation(line: 59, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !12, line: 57, column: 5)
!88 = !DILocation(line: 60, column: 5, scope: !87)
!89 = !DILocation(line: 64, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !12, line: 62, column: 5)
!91 = !DILocation(line: 64, column: 14, scope: !90)
!92 = !DILocation(line: 65, column: 9, scope: !90)
!93 = !DILocation(line: 65, column: 17, scope: !90)
!94 = !DILocalVariable(name: "source", scope: !95, file: !12, line: 68, type: !25)
!95 = distinct !DILexicalBlock(scope: !75, file: !12, line: 67, column: 5)
!96 = !DILocation(line: 68, column: 14, scope: !95)
!97 = !DILocation(line: 69, column: 9, scope: !95)
!98 = !DILocation(line: 70, column: 9, scope: !95)
!99 = !DILocation(line: 70, column: 23, scope: !95)
!100 = !DILocation(line: 72, column: 16, scope: !95)
!101 = !DILocation(line: 72, column: 9, scope: !95)
!102 = !DILocation(line: 73, column: 9, scope: !95)
!103 = !DILocation(line: 73, column: 21, scope: !95)
!104 = !DILocation(line: 74, column: 19, scope: !95)
!105 = !DILocation(line: 74, column: 9, scope: !95)
!106 = !DILocation(line: 76, column: 1, scope: !75)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 81, type: !16)
!109 = !DILocation(line: 81, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !12, line: 82, type: !20)
!111 = !DILocation(line: 82, column: 10, scope: !107)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !12, line: 83, type: !25)
!113 = !DILocation(line: 83, column: 10, scope: !107)
!114 = !DILocation(line: 84, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !12, line: 84, column: 8)
!116 = !DILocation(line: 84, column: 25, scope: !115)
!117 = !DILocation(line: 84, column: 8, scope: !107)
!118 = !DILocation(line: 87, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 85, column: 5)
!120 = !DILocation(line: 87, column: 14, scope: !119)
!121 = !DILocation(line: 88, column: 9, scope: !119)
!122 = !DILocation(line: 88, column: 17, scope: !119)
!123 = !DILocation(line: 89, column: 5, scope: !119)
!124 = !DILocalVariable(name: "source", scope: !125, file: !12, line: 91, type: !25)
!125 = distinct !DILexicalBlock(scope: !107, file: !12, line: 90, column: 5)
!126 = !DILocation(line: 91, column: 14, scope: !125)
!127 = !DILocation(line: 92, column: 9, scope: !125)
!128 = !DILocation(line: 93, column: 9, scope: !125)
!129 = !DILocation(line: 93, column: 23, scope: !125)
!130 = !DILocation(line: 95, column: 16, scope: !125)
!131 = !DILocation(line: 95, column: 9, scope: !125)
!132 = !DILocation(line: 96, column: 9, scope: !125)
!133 = !DILocation(line: 96, column: 21, scope: !125)
!134 = !DILocation(line: 97, column: 19, scope: !125)
!135 = !DILocation(line: 97, column: 9, scope: !125)
!136 = !DILocation(line: 99, column: 1, scope: !107)
