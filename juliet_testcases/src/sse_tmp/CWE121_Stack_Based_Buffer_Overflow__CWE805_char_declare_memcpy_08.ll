; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx2, align 1, !dbg !43
  %1 = load i8*, i8** %data, align 8, !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !45
  %2 = load i8*, i8** %data, align 8, !dbg !46
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !46
  store i8 0, i8* %arrayidx4, align 1, !dbg !47
  %3 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %3), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_08_good() #0 !dbg !51 {
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
  %call = call i64 @time(i64* null) #6, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #6, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_08_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_08_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !74 {
entry:
  ret i32 1, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i32 @staticReturnsFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  store i8* %arraydecay, i8** %data, align 8, !dbg !93
  %0 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx2, align 1, !dbg !101
  %1 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !104
  store i8 0, i8* %arrayidx4, align 1, !dbg !105
  %3 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %3), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !109 {
entry:
  ret i32 0, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %call = call i32 @staticReturnsTrue(), !dbg !118
  %tobool = icmp ne i32 %call, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  store i8* %arraydecay, i8** %data, align 8, !dbg !123
  %0 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx2, align 1, !dbg !132
  %1 = load i8*, i8** %data, align 8, !dbg !133
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !134
  %2 = load i8*, i8** %data, align 8, !dbg !135
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !135
  store i8 0, i8* %arrayidx4, align 1, !dbg !136
  %3 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* %3), !dbg !138
  ret void, !dbg !139
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 39, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 40, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 41, column: 10, scope: !11)
!29 = !DILocation(line: 42, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!31 = !DILocation(line: 42, column: 8, scope: !11)
!32 = !DILocation(line: 46, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 43, column: 5)
!34 = !DILocation(line: 46, column: 14, scope: !33)
!35 = !DILocation(line: 47, column: 9, scope: !33)
!36 = !DILocation(line: 47, column: 17, scope: !33)
!37 = !DILocation(line: 48, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 50, type: !25)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 49, column: 5)
!40 = !DILocation(line: 50, column: 14, scope: !39)
!41 = !DILocation(line: 51, column: 9, scope: !39)
!42 = !DILocation(line: 52, column: 9, scope: !39)
!43 = !DILocation(line: 52, column: 23, scope: !39)
!44 = !DILocation(line: 54, column: 16, scope: !39)
!45 = !DILocation(line: 54, column: 9, scope: !39)
!46 = !DILocation(line: 55, column: 9, scope: !39)
!47 = !DILocation(line: 55, column: 21, scope: !39)
!48 = !DILocation(line: 56, column: 19, scope: !39)
!49 = !DILocation(line: 56, column: 9, scope: !39)
!50 = !DILocation(line: 58, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_08_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 117, column: 5, scope: !51)
!53 = !DILocation(line: 118, column: 5, scope: !51)
!54 = !DILocation(line: 119, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !56, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 131, type: !58)
!61 = !DILocation(line: 131, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 131, type: !59)
!63 = !DILocation(line: 131, column: 27, scope: !55)
!64 = !DILocation(line: 134, column: 22, scope: !55)
!65 = !DILocation(line: 134, column: 12, scope: !55)
!66 = !DILocation(line: 134, column: 5, scope: !55)
!67 = !DILocation(line: 136, column: 5, scope: !55)
!68 = !DILocation(line: 137, column: 5, scope: !55)
!69 = !DILocation(line: 138, column: 5, scope: !55)
!70 = !DILocation(line: 141, column: 5, scope: !55)
!71 = !DILocation(line: 142, column: 5, scope: !55)
!72 = !DILocation(line: 143, column: 5, scope: !55)
!73 = !DILocation(line: 145, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !75, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!58}
!77 = !DILocation(line: 27, column: 5, scope: !74)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 67, type: !16)
!80 = !DILocation(line: 67, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !12, line: 68, type: !20)
!82 = !DILocation(line: 68, column: 10, scope: !78)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !12, line: 69, type: !25)
!84 = !DILocation(line: 69, column: 10, scope: !78)
!85 = !DILocation(line: 70, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !12, line: 70, column: 8)
!87 = !DILocation(line: 70, column: 8, scope: !78)
!88 = !DILocation(line: 73, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !12, line: 71, column: 5)
!90 = !DILocation(line: 74, column: 5, scope: !89)
!91 = !DILocation(line: 78, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !12, line: 76, column: 5)
!93 = !DILocation(line: 78, column: 14, scope: !92)
!94 = !DILocation(line: 79, column: 9, scope: !92)
!95 = !DILocation(line: 79, column: 17, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !12, line: 82, type: !25)
!97 = distinct !DILexicalBlock(scope: !78, file: !12, line: 81, column: 5)
!98 = !DILocation(line: 82, column: 14, scope: !97)
!99 = !DILocation(line: 83, column: 9, scope: !97)
!100 = !DILocation(line: 84, column: 9, scope: !97)
!101 = !DILocation(line: 84, column: 23, scope: !97)
!102 = !DILocation(line: 86, column: 16, scope: !97)
!103 = !DILocation(line: 86, column: 9, scope: !97)
!104 = !DILocation(line: 87, column: 9, scope: !97)
!105 = !DILocation(line: 87, column: 21, scope: !97)
!106 = !DILocation(line: 88, column: 19, scope: !97)
!107 = !DILocation(line: 88, column: 9, scope: !97)
!108 = !DILocation(line: 90, column: 1, scope: !78)
!109 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !75, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocation(line: 32, column: 5, scope: !109)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 95, type: !16)
!113 = !DILocation(line: 95, column: 12, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !12, line: 96, type: !20)
!115 = !DILocation(line: 96, column: 10, scope: !111)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !12, line: 97, type: !25)
!117 = !DILocation(line: 97, column: 10, scope: !111)
!118 = !DILocation(line: 98, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !12, line: 98, column: 8)
!120 = !DILocation(line: 98, column: 8, scope: !111)
!121 = !DILocation(line: 101, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 99, column: 5)
!123 = !DILocation(line: 101, column: 14, scope: !122)
!124 = !DILocation(line: 102, column: 9, scope: !122)
!125 = !DILocation(line: 102, column: 17, scope: !122)
!126 = !DILocation(line: 103, column: 5, scope: !122)
!127 = !DILocalVariable(name: "source", scope: !128, file: !12, line: 105, type: !25)
!128 = distinct !DILexicalBlock(scope: !111, file: !12, line: 104, column: 5)
!129 = !DILocation(line: 105, column: 14, scope: !128)
!130 = !DILocation(line: 106, column: 9, scope: !128)
!131 = !DILocation(line: 107, column: 9, scope: !128)
!132 = !DILocation(line: 107, column: 23, scope: !128)
!133 = !DILocation(line: 109, column: 16, scope: !128)
!134 = !DILocation(line: 109, column: 9, scope: !128)
!135 = !DILocation(line: 110, column: 9, scope: !128)
!136 = !DILocation(line: 110, column: 21, scope: !128)
!137 = !DILocation(line: 111, column: 19, scope: !128)
!138 = !DILocation(line: 111, column: 9, scope: !128)
!139 = !DILocation(line: 113, column: 1, scope: !111)
