; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %call = call i32 @staticReturnsTrue(), !dbg !28
  %tobool = icmp ne i32 %call, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 99) #5, !dbg !33
  %1 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %3 = load i32*, i32** %data, align 8, !dbg !44
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %3) #5, !dbg !45
  %4 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %4), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_08_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_08_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_08_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !73 {
entry:
  ret i32 1, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !82
  store i32* %arraydecay, i32** %data, align 8, !dbg !83
  %call = call i32 @staticReturnsFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !90
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #5, !dbg !92
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !97
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !98
  %3 = load i32*, i32** %data, align 8, !dbg !99
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %3) #5, !dbg !100
  %4 = load i32*, i32** %data, align 8, !dbg !101
  call void @printWLine(i32* %4), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !104 {
entry:
  ret i32 0, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !111
  store i32* %arraydecay, i32** %data, align 8, !dbg !112
  %call = call i32 @staticReturnsTrue(), !dbg !113
  %tobool = icmp ne i32 %call, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %0 = load i32*, i32** %data, align 8, !dbg !116
  %call1 = call i32* @wmemset(i32* %0, i32 65, i64 49) #5, !dbg !118
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !124
  %arraydecay2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !125
  %3 = load i32*, i32** %data, align 8, !dbg !126
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %3) #5, !dbg !127
  %4 = load i32*, i32** %data, align 8, !dbg !128
  call void @printWLine(i32* %4), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocation(line: 41, column: 12, scope: !11)
!27 = !DILocation(line: 41, column: 10, scope: !11)
!28 = !DILocation(line: 42, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!30 = !DILocation(line: 42, column: 8, scope: !11)
!31 = !DILocation(line: 45, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !12, line: 43, column: 5)
!33 = !DILocation(line: 45, column: 9, scope: !32)
!34 = !DILocation(line: 46, column: 9, scope: !32)
!35 = !DILocation(line: 46, column: 21, scope: !32)
!36 = !DILocation(line: 47, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !12, line: 49, type: !39)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 49, column: 17, scope: !38)
!43 = !DILocation(line: 51, column: 16, scope: !38)
!44 = !DILocation(line: 51, column: 22, scope: !38)
!45 = !DILocation(line: 51, column: 9, scope: !38)
!46 = !DILocation(line: 52, column: 20, scope: !38)
!47 = !DILocation(line: 52, column: 9, scope: !38)
!48 = !DILocation(line: 54, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_08_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 107, column: 5, scope: !49)
!51 = !DILocation(line: 108, column: 5, scope: !49)
!52 = !DILocation(line: 109, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !54, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!19, !19, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 121, type: !19)
!60 = !DILocation(line: 121, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 121, type: !56)
!62 = !DILocation(line: 121, column: 27, scope: !53)
!63 = !DILocation(line: 124, column: 22, scope: !53)
!64 = !DILocation(line: 124, column: 12, scope: !53)
!65 = !DILocation(line: 124, column: 5, scope: !53)
!66 = !DILocation(line: 126, column: 5, scope: !53)
!67 = !DILocation(line: 127, column: 5, scope: !53)
!68 = !DILocation(line: 128, column: 5, scope: !53)
!69 = !DILocation(line: 131, column: 5, scope: !53)
!70 = !DILocation(line: 132, column: 5, scope: !53)
!71 = !DILocation(line: 133, column: 5, scope: !53)
!72 = !DILocation(line: 135, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !74, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!19}
!76 = !DILocation(line: 27, column: 5, scope: !73)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 63, type: !16)
!79 = !DILocation(line: 63, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !12, line: 64, type: !22)
!81 = !DILocation(line: 64, column: 13, scope: !77)
!82 = !DILocation(line: 65, column: 12, scope: !77)
!83 = !DILocation(line: 65, column: 10, scope: !77)
!84 = !DILocation(line: 66, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !12, line: 66, column: 8)
!86 = !DILocation(line: 66, column: 8, scope: !77)
!87 = !DILocation(line: 69, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !12, line: 67, column: 5)
!89 = !DILocation(line: 70, column: 5, scope: !88)
!90 = !DILocation(line: 74, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !12, line: 72, column: 5)
!92 = !DILocation(line: 74, column: 9, scope: !91)
!93 = !DILocation(line: 75, column: 9, scope: !91)
!94 = !DILocation(line: 75, column: 20, scope: !91)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !12, line: 78, type: !39)
!96 = distinct !DILexicalBlock(scope: !77, file: !12, line: 77, column: 5)
!97 = !DILocation(line: 78, column: 17, scope: !96)
!98 = !DILocation(line: 80, column: 16, scope: !96)
!99 = !DILocation(line: 80, column: 22, scope: !96)
!100 = !DILocation(line: 80, column: 9, scope: !96)
!101 = !DILocation(line: 81, column: 20, scope: !96)
!102 = !DILocation(line: 81, column: 9, scope: !96)
!103 = !DILocation(line: 83, column: 1, scope: !77)
!104 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !74, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocation(line: 32, column: 5, scope: !104)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 88, type: !16)
!108 = !DILocation(line: 88, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !12, line: 89, type: !22)
!110 = !DILocation(line: 89, column: 13, scope: !106)
!111 = !DILocation(line: 90, column: 12, scope: !106)
!112 = !DILocation(line: 90, column: 10, scope: !106)
!113 = !DILocation(line: 91, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !12, line: 91, column: 8)
!115 = !DILocation(line: 91, column: 8, scope: !106)
!116 = !DILocation(line: 94, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 92, column: 5)
!118 = !DILocation(line: 94, column: 9, scope: !117)
!119 = !DILocation(line: 95, column: 9, scope: !117)
!120 = !DILocation(line: 95, column: 20, scope: !117)
!121 = !DILocation(line: 96, column: 5, scope: !117)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !12, line: 98, type: !39)
!123 = distinct !DILexicalBlock(scope: !106, file: !12, line: 97, column: 5)
!124 = !DILocation(line: 98, column: 17, scope: !123)
!125 = !DILocation(line: 100, column: 16, scope: !123)
!126 = !DILocation(line: 100, column: 22, scope: !123)
!127 = !DILocation(line: 100, column: 9, scope: !123)
!128 = !DILocation(line: 101, column: 20, scope: !123)
!129 = !DILocation(line: 101, column: 9, scope: !123)
!130 = !DILocation(line: 103, column: 1, scope: !106)
