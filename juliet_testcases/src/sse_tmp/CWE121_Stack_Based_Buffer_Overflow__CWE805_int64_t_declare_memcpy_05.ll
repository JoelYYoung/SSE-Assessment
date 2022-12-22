; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_05.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* @staticTrue, align 4, !dbg !39
  %tobool = icmp ne i32 %0, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i64* %arraydecay, i64** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !46, metadata !DIExpression()), !dbg !48
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !48
  %2 = load i64*, i64** %data, align 8, !dbg !49
  %3 = bitcast i64* %2 to i8*, !dbg !50
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !50
  %4 = bitcast i64* %arraydecay1 to i8*, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !50
  %5 = load i64*, i64** %data, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !51
  %6 = load i64, i64* %arrayidx, align 8, !dbg !51
  call void @printLongLongLine(i64 %6), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_05_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_05_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_05_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = load i32, i32* @staticFalse, align 4, !dbg !85
  %tobool = icmp ne i32 %0, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !98
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !109
  %tobool = icmp ne i32 %0, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i64* %arraydecay, i64** %data, align 8, !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !118
  %2 = load i64*, i64** %data, align 8, !dbg !119
  %3 = bitcast i64* %2 to i8*, !dbg !120
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !120
  %4 = bitcast i64* %arraydecay1 to i8*, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !120
  %5 = load i64*, i64** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !121
  %6 = load i64, i64* %arrayidx, align 8, !dbg !121
  call void @printLongLongLine(i64 %6), !dbg !122
  ret void, !dbg !123
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
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 30, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !24, line: 27, baseType: !25)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !26, line: 43, baseType: !27)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!27 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!28 = !DILocation(line: 30, column: 15, scope: !18)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 31, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 31, column: 13, scope: !18)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 32, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 32, column: 13, scope: !18)
!39 = !DILocation(line: 33, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 8)
!41 = !DILocation(line: 33, column: 8, scope: !18)
!42 = !DILocation(line: 37, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !10, line: 34, column: 5)
!44 = !DILocation(line: 37, column: 14, scope: !43)
!45 = !DILocation(line: 38, column: 5, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !10, line: 40, type: !35)
!47 = distinct !DILexicalBlock(scope: !18, file: !10, line: 39, column: 5)
!48 = !DILocation(line: 40, column: 17, scope: !47)
!49 = !DILocation(line: 42, column: 16, scope: !47)
!50 = !DILocation(line: 42, column: 9, scope: !47)
!51 = !DILocation(line: 43, column: 27, scope: !47)
!52 = !DILocation(line: 43, column: 9, scope: !47)
!53 = !DILocation(line: 45, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_05_good", scope: !10, file: !10, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 96, column: 5, scope: !54)
!56 = !DILocation(line: 97, column: 5, scope: !54)
!57 = !DILocation(line: 98, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 110, type: !59, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!11, !11, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !10, line: 110, type: !11)
!65 = !DILocation(line: 110, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !10, line: 110, type: !61)
!67 = !DILocation(line: 110, column: 27, scope: !58)
!68 = !DILocation(line: 113, column: 22, scope: !58)
!69 = !DILocation(line: 113, column: 12, scope: !58)
!70 = !DILocation(line: 113, column: 5, scope: !58)
!71 = !DILocation(line: 115, column: 5, scope: !58)
!72 = !DILocation(line: 116, column: 5, scope: !58)
!73 = !DILocation(line: 117, column: 5, scope: !58)
!74 = !DILocation(line: 120, column: 5, scope: !58)
!75 = !DILocation(line: 121, column: 5, scope: !58)
!76 = !DILocation(line: 122, column: 5, scope: !58)
!77 = !DILocation(line: 124, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 52, type: !19, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !10, line: 54, type: !22)
!80 = !DILocation(line: 54, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !10, line: 55, type: !30)
!82 = !DILocation(line: 55, column: 13, scope: !78)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !10, line: 56, type: !35)
!84 = !DILocation(line: 56, column: 13, scope: !78)
!85 = !DILocation(line: 57, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !10, line: 57, column: 8)
!87 = !DILocation(line: 57, column: 8, scope: !78)
!88 = !DILocation(line: 60, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !10, line: 58, column: 5)
!90 = !DILocation(line: 61, column: 5, scope: !89)
!91 = !DILocation(line: 65, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !10, line: 63, column: 5)
!93 = !DILocation(line: 65, column: 14, scope: !92)
!94 = !DILocalVariable(name: "source", scope: !95, file: !10, line: 68, type: !35)
!95 = distinct !DILexicalBlock(scope: !78, file: !10, line: 67, column: 5)
!96 = !DILocation(line: 68, column: 17, scope: !95)
!97 = !DILocation(line: 70, column: 16, scope: !95)
!98 = !DILocation(line: 70, column: 9, scope: !95)
!99 = !DILocation(line: 71, column: 27, scope: !95)
!100 = !DILocation(line: 71, column: 9, scope: !95)
!101 = !DILocation(line: 73, column: 1, scope: !78)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 76, type: !19, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !10, line: 78, type: !22)
!104 = !DILocation(line: 78, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !10, line: 79, type: !30)
!106 = !DILocation(line: 79, column: 13, scope: !102)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !10, line: 80, type: !35)
!108 = !DILocation(line: 80, column: 13, scope: !102)
!109 = !DILocation(line: 81, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !10, line: 81, column: 8)
!111 = !DILocation(line: 81, column: 8, scope: !102)
!112 = !DILocation(line: 84, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !10, line: 82, column: 5)
!114 = !DILocation(line: 84, column: 14, scope: !113)
!115 = !DILocation(line: 85, column: 5, scope: !113)
!116 = !DILocalVariable(name: "source", scope: !117, file: !10, line: 87, type: !35)
!117 = distinct !DILexicalBlock(scope: !102, file: !10, line: 86, column: 5)
!118 = !DILocation(line: 87, column: 17, scope: !117)
!119 = !DILocation(line: 89, column: 16, scope: !117)
!120 = !DILocation(line: 89, column: 9, scope: !117)
!121 = !DILocation(line: 90, column: 27, scope: !117)
!122 = !DILocation(line: 90, column: 9, scope: !117)
!123 = !DILocation(line: 92, column: 1, scope: !102)
