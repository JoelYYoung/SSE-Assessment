; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !19, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  %0 = load i32, i32* @staticFive, align 4, !dbg !37
  %cmp = icmp eq i32 %0, 5, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i64* %arraydecay, i64** %data, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !47
  %2 = load i64*, i64** %data, align 8, !dbg !48
  %3 = bitcast i64* %2 to i8*, !dbg !49
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !49
  %4 = bitcast i64* %arraydecay1 to i8*, !dbg !49
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !49
  %5 = load i64*, i64** %data, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !50
  %6 = load i64, i64* %arrayidx, align 8, !dbg !50
  call void @printLongLongLine(i64 %6), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_07_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_07_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_07_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp ne i32 %0, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  store i64* %arraydecay, i64** %data, align 8, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !96
  %2 = load i64*, i64** %data, align 8, !dbg !97
  %3 = bitcast i64* %2 to i8*, !dbg !98
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !98
  %4 = bitcast i64* %arraydecay1 to i8*, !dbg !98
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !98
  %5 = load i64*, i64** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !99
  %6 = load i64, i64* %arrayidx, align 8, !dbg !99
  call void @printLongLongLine(i64 %6), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = load i32, i32* @staticFive, align 4, !dbg !109
  %cmp = icmp eq i32 %0, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i64* %arraydecay, i64** %data, align 8, !dbg !115
  br label %if.end, !dbg !116

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !119
  %2 = load i64*, i64** %data, align 8, !dbg !120
  %3 = bitcast i64* %2 to i8*, !dbg !121
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !121
  %4 = bitcast i64* %arraydecay1 to i8*, !dbg !121
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !121
  %5 = load i64*, i64** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !122
  %6 = load i64, i64* %arrayidx, align 8, !dbg !122
  call void @printLongLongLine(i64 %6), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 29, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !22, line: 27, baseType: !23)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !24, line: 43, baseType: !25)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!25 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!26 = !DILocation(line: 29, column: 15, scope: !16)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 30, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 50)
!31 = !DILocation(line: 30, column: 13, scope: !16)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 31, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 6400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 31, column: 13, scope: !16)
!37 = !DILocation(line: 32, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !16, file: !8, line: 32, column: 8)
!39 = !DILocation(line: 32, column: 18, scope: !38)
!40 = !DILocation(line: 32, column: 8, scope: !16)
!41 = !DILocation(line: 36, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !8, line: 33, column: 5)
!43 = !DILocation(line: 36, column: 14, scope: !42)
!44 = !DILocation(line: 37, column: 5, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !8, line: 39, type: !33)
!46 = distinct !DILexicalBlock(scope: !16, file: !8, line: 38, column: 5)
!47 = !DILocation(line: 39, column: 17, scope: !46)
!48 = !DILocation(line: 41, column: 17, scope: !46)
!49 = !DILocation(line: 41, column: 9, scope: !46)
!50 = !DILocation(line: 42, column: 27, scope: !46)
!51 = !DILocation(line: 42, column: 9, scope: !46)
!52 = !DILocation(line: 44, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_07_good", scope: !8, file: !8, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 95, column: 5, scope: !53)
!55 = !DILocation(line: 96, column: 5, scope: !53)
!56 = !DILocation(line: 97, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 109, type: !58, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!9, !9, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !8, line: 109, type: !9)
!64 = !DILocation(line: 109, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !8, line: 109, type: !60)
!66 = !DILocation(line: 109, column: 27, scope: !57)
!67 = !DILocation(line: 112, column: 22, scope: !57)
!68 = !DILocation(line: 112, column: 12, scope: !57)
!69 = !DILocation(line: 112, column: 5, scope: !57)
!70 = !DILocation(line: 114, column: 5, scope: !57)
!71 = !DILocation(line: 115, column: 5, scope: !57)
!72 = !DILocation(line: 116, column: 5, scope: !57)
!73 = !DILocation(line: 119, column: 5, scope: !57)
!74 = !DILocation(line: 120, column: 5, scope: !57)
!75 = !DILocation(line: 121, column: 5, scope: !57)
!76 = !DILocation(line: 123, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !8, line: 53, type: !20)
!79 = !DILocation(line: 53, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !8, line: 54, type: !28)
!81 = !DILocation(line: 54, column: 13, scope: !77)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !8, line: 55, type: !33)
!83 = !DILocation(line: 55, column: 13, scope: !77)
!84 = !DILocation(line: 56, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !8, line: 56, column: 8)
!86 = !DILocation(line: 56, column: 18, scope: !85)
!87 = !DILocation(line: 56, column: 8, scope: !77)
!88 = !DILocation(line: 59, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !8, line: 57, column: 5)
!90 = !DILocation(line: 60, column: 5, scope: !89)
!91 = !DILocation(line: 64, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !8, line: 62, column: 5)
!93 = !DILocation(line: 64, column: 14, scope: !92)
!94 = !DILocalVariable(name: "source", scope: !95, file: !8, line: 67, type: !33)
!95 = distinct !DILexicalBlock(scope: !77, file: !8, line: 66, column: 5)
!96 = !DILocation(line: 67, column: 17, scope: !95)
!97 = !DILocation(line: 69, column: 17, scope: !95)
!98 = !DILocation(line: 69, column: 9, scope: !95)
!99 = !DILocation(line: 70, column: 27, scope: !95)
!100 = !DILocation(line: 70, column: 9, scope: !95)
!101 = !DILocation(line: 72, column: 1, scope: !77)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 75, type: !17, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !8, line: 77, type: !20)
!104 = !DILocation(line: 77, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !8, line: 78, type: !28)
!106 = !DILocation(line: 78, column: 13, scope: !102)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !8, line: 79, type: !33)
!108 = !DILocation(line: 79, column: 13, scope: !102)
!109 = !DILocation(line: 80, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !8, line: 80, column: 8)
!111 = !DILocation(line: 80, column: 18, scope: !110)
!112 = !DILocation(line: 80, column: 8, scope: !102)
!113 = !DILocation(line: 83, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !8, line: 81, column: 5)
!115 = !DILocation(line: 83, column: 14, scope: !114)
!116 = !DILocation(line: 84, column: 5, scope: !114)
!117 = !DILocalVariable(name: "source", scope: !118, file: !8, line: 86, type: !33)
!118 = distinct !DILexicalBlock(scope: !102, file: !8, line: 85, column: 5)
!119 = !DILocation(line: 86, column: 17, scope: !118)
!120 = !DILocation(line: 88, column: 17, scope: !118)
!121 = !DILocation(line: 88, column: 9, scope: !118)
!122 = !DILocation(line: 89, column: 27, scope: !118)
!123 = !DILocation(line: 89, column: 9, scope: !118)
!124 = !DILocation(line: 91, column: 1, scope: !102)
