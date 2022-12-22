; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %call = call i32 @staticReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08_bad.source to i8*), i64 44, i1 false), !dbg !42
  %2 = load i32*, i32** %data, align 8, !dbg !43
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !45
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !46
  %add = add i64 %call3, 1, !dbg !47
  %call4 = call i32* @wcsncpy(i32* %2, i32* %arraydecay1, i64 %add) #7, !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %3), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08_good() #0 !dbg !52 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !76 {
entry:
  ret i32 1, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i32 @staticReturnsFalse(), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !93
  store i32* %arraydecay, i32** %data, align 8, !dbg !95
  %0 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !100
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !102
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !104
  %add = add i64 %call3, 1, !dbg !105
  %call4 = call i32* @wcsncpy(i32* %2, i32* %arraydecay1, i64 %add) #7, !dbg !106
  %3 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %3), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !110 {
entry:
  ret i32 0, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call i32 @staticReturnsTrue(), !dbg !119
  %tobool = icmp ne i32 %call, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !122
  store i32* %arraydecay, i32** %data, align 8, !dbg !124
  %0 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !130
  %2 = load i32*, i32** %data, align 8, !dbg !131
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !132
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !133
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !134
  %add = add i64 %call3, 1, !dbg !135
  %call4 = call i32* @wcsncpy(i32* %2, i32* %arraydecay1, i64 %add) #7, !dbg !136
  %3 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* %3), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08_bad", scope: !12, file: !12, line: 42, type: !13, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 44, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 44, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 45, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 45, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 46, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 46, column: 13, scope: !11)
!31 = !DILocation(line: 47, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 47, column: 8)
!33 = !DILocation(line: 47, column: 8, scope: !11)
!34 = !DILocation(line: 51, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 48, column: 5)
!36 = !DILocation(line: 51, column: 14, scope: !35)
!37 = !DILocation(line: 52, column: 9, scope: !35)
!38 = !DILocation(line: 52, column: 17, scope: !35)
!39 = !DILocation(line: 53, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 55, type: !27)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 54, column: 5)
!42 = !DILocation(line: 55, column: 17, scope: !41)
!43 = !DILocation(line: 58, column: 17, scope: !41)
!44 = !DILocation(line: 58, column: 23, scope: !41)
!45 = !DILocation(line: 58, column: 38, scope: !41)
!46 = !DILocation(line: 58, column: 31, scope: !41)
!47 = !DILocation(line: 58, column: 46, scope: !41)
!48 = !DILocation(line: 58, column: 9, scope: !41)
!49 = !DILocation(line: 59, column: 20, scope: !41)
!50 = !DILocation(line: 59, column: 9, scope: !41)
!51 = !DILocation(line: 61, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_08_good", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 118, column: 5, scope: !52)
!54 = !DILocation(line: 119, column: 5, scope: !52)
!55 = !DILocation(line: 120, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 132, type: !57, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!19, !19, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 132, type: !19)
!63 = !DILocation(line: 132, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 132, type: !59)
!65 = !DILocation(line: 132, column: 27, scope: !56)
!66 = !DILocation(line: 135, column: 22, scope: !56)
!67 = !DILocation(line: 135, column: 12, scope: !56)
!68 = !DILocation(line: 135, column: 5, scope: !56)
!69 = !DILocation(line: 137, column: 5, scope: !56)
!70 = !DILocation(line: 138, column: 5, scope: !56)
!71 = !DILocation(line: 139, column: 5, scope: !56)
!72 = !DILocation(line: 142, column: 5, scope: !56)
!73 = !DILocation(line: 143, column: 5, scope: !56)
!74 = !DILocation(line: 144, column: 5, scope: !56)
!75 = !DILocation(line: 146, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 30, type: !77, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!19}
!79 = !DILocation(line: 32, column: 5, scope: !76)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 70, type: !16)
!82 = !DILocation(line: 70, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !12, line: 71, type: !22)
!84 = !DILocation(line: 71, column: 13, scope: !80)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !12, line: 72, type: !27)
!86 = !DILocation(line: 72, column: 13, scope: !80)
!87 = !DILocation(line: 73, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !80, file: !12, line: 73, column: 8)
!89 = !DILocation(line: 73, column: 8, scope: !80)
!90 = !DILocation(line: 76, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !12, line: 74, column: 5)
!92 = !DILocation(line: 77, column: 5, scope: !91)
!93 = !DILocation(line: 82, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !12, line: 79, column: 5)
!95 = !DILocation(line: 82, column: 14, scope: !94)
!96 = !DILocation(line: 83, column: 9, scope: !94)
!97 = !DILocation(line: 83, column: 17, scope: !94)
!98 = !DILocalVariable(name: "source", scope: !99, file: !12, line: 86, type: !27)
!99 = distinct !DILexicalBlock(scope: !80, file: !12, line: 85, column: 5)
!100 = !DILocation(line: 86, column: 17, scope: !99)
!101 = !DILocation(line: 89, column: 17, scope: !99)
!102 = !DILocation(line: 89, column: 23, scope: !99)
!103 = !DILocation(line: 89, column: 38, scope: !99)
!104 = !DILocation(line: 89, column: 31, scope: !99)
!105 = !DILocation(line: 89, column: 46, scope: !99)
!106 = !DILocation(line: 89, column: 9, scope: !99)
!107 = !DILocation(line: 90, column: 20, scope: !99)
!108 = !DILocation(line: 90, column: 9, scope: !99)
!109 = !DILocation(line: 92, column: 1, scope: !80)
!110 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 35, type: !77, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocation(line: 37, column: 5, scope: !110)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 97, type: !16)
!114 = !DILocation(line: 97, column: 15, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !12, line: 98, type: !22)
!116 = !DILocation(line: 98, column: 13, scope: !112)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !12, line: 99, type: !27)
!118 = !DILocation(line: 99, column: 13, scope: !112)
!119 = !DILocation(line: 100, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !112, file: !12, line: 100, column: 8)
!121 = !DILocation(line: 100, column: 8, scope: !112)
!122 = !DILocation(line: 104, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 101, column: 5)
!124 = !DILocation(line: 104, column: 14, scope: !123)
!125 = !DILocation(line: 105, column: 9, scope: !123)
!126 = !DILocation(line: 105, column: 17, scope: !123)
!127 = !DILocation(line: 106, column: 5, scope: !123)
!128 = !DILocalVariable(name: "source", scope: !129, file: !12, line: 108, type: !27)
!129 = distinct !DILexicalBlock(scope: !112, file: !12, line: 107, column: 5)
!130 = !DILocation(line: 108, column: 17, scope: !129)
!131 = !DILocation(line: 111, column: 17, scope: !129)
!132 = !DILocation(line: 111, column: 23, scope: !129)
!133 = !DILocation(line: 111, column: 38, scope: !129)
!134 = !DILocation(line: 111, column: 31, scope: !129)
!135 = !DILocation(line: 111, column: 46, scope: !129)
!136 = !DILocation(line: 111, column: 9, scope: !129)
!137 = !DILocation(line: 112, column: 20, scope: !129)
!138 = !DILocation(line: 112, column: 9, scope: !129)
!139 = !DILocation(line: 114, column: 1, scope: !112)
