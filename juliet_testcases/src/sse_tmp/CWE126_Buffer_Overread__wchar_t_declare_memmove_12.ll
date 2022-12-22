; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !32
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !36
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  %call4 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !39
  %tobool = icmp ne i32 %call4, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.else, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay5, i32** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.else:                                          ; preds = %entry
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !46
  store i32* %arraydecay6, i32** %data, align 8, !dbg !48
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !51
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call8 = call i32* @wmemset(i32* %arraydecay7, i32 67, i64 99) #6, !dbg !53
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx9, align 4, !dbg !55
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %0 = bitcast i32* %arraydecay10 to i8*, !dbg !56
  %1 = load i32*, i32** %data, align 8, !dbg !57
  %2 = bitcast i32* %1 to i8*, !dbg !56
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call12 = call i64 @wcslen(i32* %arraydecay11) #7, !dbg !59
  %mul = mul i64 %call12, 4, !dbg !60
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !56
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx13, align 4, !dbg !62
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay14), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local i32 @globalReturnsTrueOrFalse(...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_12_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #6, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #6, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_12_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_12_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !96
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !97
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !100
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !101
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !102
  store i32 0, i32* %arrayidx3, align 4, !dbg !103
  %call4 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !104
  %tobool = icmp ne i32 %call4, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay5, i32** %data, align 8, !dbg !109
  br label %if.end, !dbg !110

if.else:                                          ; preds = %entry
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !111
  store i32* %arraydecay6, i32** %data, align 8, !dbg !113
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  %call8 = call i32* @wmemset(i32* %arraydecay7, i32 67, i64 99) #6, !dbg !118
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx9, align 4, !dbg !120
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !121
  %0 = bitcast i32* %arraydecay10 to i8*, !dbg !121
  %1 = load i32*, i32** %data, align 8, !dbg !122
  %2 = bitcast i32* %1 to i8*, !dbg !121
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %call12 = call i64 @wcslen(i32* %arraydecay11) #7, !dbg !124
  %mul = mul i64 %call12, 4, !dbg !125
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !121
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx13, align 4, !dbg !127
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  call void @printWLine(i32* %arraydecay14), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 28, column: 13, scope: !11)
!32 = !DILocation(line: 28, column: 5, scope: !11)
!33 = !DILocation(line: 29, column: 5, scope: !11)
!34 = !DILocation(line: 29, column: 25, scope: !11)
!35 = !DILocation(line: 30, column: 13, scope: !11)
!36 = !DILocation(line: 30, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 5, scope: !11)
!38 = !DILocation(line: 31, column: 27, scope: !11)
!39 = !DILocation(line: 32, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!41 = !DILocation(line: 32, column: 8, scope: !11)
!42 = !DILocation(line: 35, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 33, column: 5)
!44 = !DILocation(line: 35, column: 14, scope: !43)
!45 = !DILocation(line: 36, column: 5, scope: !43)
!46 = !DILocation(line: 40, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !40, file: !12, line: 38, column: 5)
!48 = !DILocation(line: 40, column: 14, scope: !47)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !12, line: 43, type: !27)
!50 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 5)
!51 = !DILocation(line: 43, column: 17, scope: !50)
!52 = !DILocation(line: 44, column: 17, scope: !50)
!53 = !DILocation(line: 44, column: 9, scope: !50)
!54 = !DILocation(line: 45, column: 9, scope: !50)
!55 = !DILocation(line: 45, column: 21, scope: !50)
!56 = !DILocation(line: 48, column: 9, scope: !50)
!57 = !DILocation(line: 48, column: 23, scope: !50)
!58 = !DILocation(line: 48, column: 36, scope: !50)
!59 = !DILocation(line: 48, column: 29, scope: !50)
!60 = !DILocation(line: 48, column: 41, scope: !50)
!61 = !DILocation(line: 49, column: 9, scope: !50)
!62 = !DILocation(line: 49, column: 21, scope: !50)
!63 = !DILocation(line: 50, column: 20, scope: !50)
!64 = !DILocation(line: 50, column: 9, scope: !50)
!65 = !DILocation(line: 52, column: 1, scope: !11)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_12_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 93, column: 5, scope: !66)
!68 = !DILocation(line: 94, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !70, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!19, !19, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !12, line: 106, type: !19)
!76 = !DILocation(line: 106, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !12, line: 106, type: !72)
!78 = !DILocation(line: 106, column: 27, scope: !69)
!79 = !DILocation(line: 109, column: 22, scope: !69)
!80 = !DILocation(line: 109, column: 12, scope: !69)
!81 = !DILocation(line: 109, column: 5, scope: !69)
!82 = !DILocation(line: 111, column: 5, scope: !69)
!83 = !DILocation(line: 112, column: 5, scope: !69)
!84 = !DILocation(line: 113, column: 5, scope: !69)
!85 = !DILocation(line: 116, column: 5, scope: !69)
!86 = !DILocation(line: 117, column: 5, scope: !69)
!87 = !DILocation(line: 118, column: 5, scope: !69)
!88 = !DILocation(line: 120, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 62, type: !16)
!91 = !DILocation(line: 62, column: 15, scope: !89)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !89, file: !12, line: 63, type: !22)
!93 = !DILocation(line: 63, column: 13, scope: !89)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !89, file: !12, line: 64, type: !27)
!95 = !DILocation(line: 64, column: 13, scope: !89)
!96 = !DILocation(line: 65, column: 13, scope: !89)
!97 = !DILocation(line: 65, column: 5, scope: !89)
!98 = !DILocation(line: 66, column: 5, scope: !89)
!99 = !DILocation(line: 66, column: 25, scope: !89)
!100 = !DILocation(line: 67, column: 13, scope: !89)
!101 = !DILocation(line: 67, column: 5, scope: !89)
!102 = !DILocation(line: 68, column: 5, scope: !89)
!103 = !DILocation(line: 68, column: 27, scope: !89)
!104 = !DILocation(line: 69, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !89, file: !12, line: 69, column: 8)
!106 = !DILocation(line: 69, column: 8, scope: !89)
!107 = !DILocation(line: 72, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !12, line: 70, column: 5)
!109 = !DILocation(line: 72, column: 14, scope: !108)
!110 = !DILocation(line: 73, column: 5, scope: !108)
!111 = !DILocation(line: 77, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !12, line: 75, column: 5)
!113 = !DILocation(line: 77, column: 14, scope: !112)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !12, line: 80, type: !27)
!115 = distinct !DILexicalBlock(scope: !89, file: !12, line: 79, column: 5)
!116 = !DILocation(line: 80, column: 17, scope: !115)
!117 = !DILocation(line: 81, column: 17, scope: !115)
!118 = !DILocation(line: 81, column: 9, scope: !115)
!119 = !DILocation(line: 82, column: 9, scope: !115)
!120 = !DILocation(line: 82, column: 21, scope: !115)
!121 = !DILocation(line: 85, column: 9, scope: !115)
!122 = !DILocation(line: 85, column: 23, scope: !115)
!123 = !DILocation(line: 85, column: 36, scope: !115)
!124 = !DILocation(line: 85, column: 29, scope: !115)
!125 = !DILocation(line: 85, column: 41, scope: !115)
!126 = !DILocation(line: 86, column: 9, scope: !115)
!127 = !DILocation(line: 86, column: 21, scope: !115)
!128 = !DILocation(line: 87, column: 20, scope: !115)
!129 = !DILocation(line: 87, column: 9, scope: !115)
!130 = !DILocation(line: 89, column: 1, scope: !89)
