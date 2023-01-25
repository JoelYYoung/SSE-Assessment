; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_02.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_02_bad() #0 !dbg !11 {
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
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay4, i32** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !45
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !46
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !47
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx7, align 4, !dbg !49
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !50
  %1 = load i32*, i32** %data, align 8, !dbg !51
  %2 = bitcast i32* %1 to i8*, !dbg !50
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !53
  %mul = mul i64 %call10, 4, !dbg !54
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !50
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx11, align 4, !dbg !56
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  call void @printWLine(i32* %arraydecay12), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_02_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #6, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #6, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_02_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_02_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !91
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !92
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !95
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !96
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx3, align 4, !dbg !98
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i32* %arraydecay4, i32** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !106
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !107
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx7, align 4, !dbg !109
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !110
  %1 = load i32*, i32** %data, align 8, !dbg !111
  %2 = bitcast i32* %1 to i8*, !dbg !110
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !113
  %mul = mul i64 %call10, 4, !dbg !114
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !110
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx11, align 4, !dbg !116
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  call void @printWLine(i32* %arraydecay12), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !127
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !128
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !131
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !132
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx3, align 4, !dbg !134
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !135
  store i32* %arraydecay4, i32** %data, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !139, metadata !DIExpression()), !dbg !141
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !143
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !144
  store i32 0, i32* %arrayidx7, align 4, !dbg !145
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !146
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !146
  %1 = load i32*, i32** %data, align 8, !dbg !147
  %2 = bitcast i32* %1 to i8*, !dbg !146
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !149
  %mul = mul i64 %call10, 4, !dbg !150
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !146
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx11, align 4, !dbg !152
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !153
  call void @printWLine(i32* %arraydecay12), !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_02.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_02_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_02.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
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
!39 = !DILocation(line: 35, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !41, file: !12, line: 33, column: 5)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!42 = !DILocation(line: 35, column: 14, scope: !40)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !12, line: 38, type: !27)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 17, scope: !44)
!46 = !DILocation(line: 39, column: 17, scope: !44)
!47 = !DILocation(line: 39, column: 9, scope: !44)
!48 = !DILocation(line: 40, column: 9, scope: !44)
!49 = !DILocation(line: 40, column: 21, scope: !44)
!50 = !DILocation(line: 43, column: 9, scope: !44)
!51 = !DILocation(line: 43, column: 23, scope: !44)
!52 = !DILocation(line: 43, column: 36, scope: !44)
!53 = !DILocation(line: 43, column: 29, scope: !44)
!54 = !DILocation(line: 43, column: 41, scope: !44)
!55 = !DILocation(line: 44, column: 9, scope: !44)
!56 = !DILocation(line: 44, column: 21, scope: !44)
!57 = !DILocation(line: 45, column: 20, scope: !44)
!58 = !DILocation(line: 45, column: 9, scope: !44)
!59 = !DILocation(line: 47, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_02_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 114, column: 5, scope: !60)
!62 = !DILocation(line: 115, column: 5, scope: !60)
!63 = !DILocation(line: 116, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 128, type: !65, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!19, !19, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !12, line: 128, type: !19)
!71 = !DILocation(line: 128, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !12, line: 128, type: !67)
!73 = !DILocation(line: 128, column: 27, scope: !64)
!74 = !DILocation(line: 131, column: 22, scope: !64)
!75 = !DILocation(line: 131, column: 12, scope: !64)
!76 = !DILocation(line: 131, column: 5, scope: !64)
!77 = !DILocation(line: 133, column: 5, scope: !64)
!78 = !DILocation(line: 134, column: 5, scope: !64)
!79 = !DILocation(line: 135, column: 5, scope: !64)
!80 = !DILocation(line: 138, column: 5, scope: !64)
!81 = !DILocation(line: 139, column: 5, scope: !64)
!82 = !DILocation(line: 140, column: 5, scope: !64)
!83 = !DILocation(line: 142, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 56, type: !16)
!86 = !DILocation(line: 56, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !12, line: 57, type: !22)
!88 = !DILocation(line: 57, column: 13, scope: !84)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !12, line: 58, type: !27)
!90 = !DILocation(line: 58, column: 13, scope: !84)
!91 = !DILocation(line: 59, column: 13, scope: !84)
!92 = !DILocation(line: 59, column: 5, scope: !84)
!93 = !DILocation(line: 60, column: 5, scope: !84)
!94 = !DILocation(line: 60, column: 25, scope: !84)
!95 = !DILocation(line: 61, column: 13, scope: !84)
!96 = !DILocation(line: 61, column: 5, scope: !84)
!97 = !DILocation(line: 62, column: 5, scope: !84)
!98 = !DILocation(line: 62, column: 27, scope: !84)
!99 = !DILocation(line: 71, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !12, line: 69, column: 5)
!101 = distinct !DILexicalBlock(scope: !84, file: !12, line: 63, column: 8)
!102 = !DILocation(line: 71, column: 14, scope: !100)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !12, line: 74, type: !27)
!104 = distinct !DILexicalBlock(scope: !84, file: !12, line: 73, column: 5)
!105 = !DILocation(line: 74, column: 17, scope: !104)
!106 = !DILocation(line: 75, column: 17, scope: !104)
!107 = !DILocation(line: 75, column: 9, scope: !104)
!108 = !DILocation(line: 76, column: 9, scope: !104)
!109 = !DILocation(line: 76, column: 21, scope: !104)
!110 = !DILocation(line: 79, column: 9, scope: !104)
!111 = !DILocation(line: 79, column: 23, scope: !104)
!112 = !DILocation(line: 79, column: 36, scope: !104)
!113 = !DILocation(line: 79, column: 29, scope: !104)
!114 = !DILocation(line: 79, column: 41, scope: !104)
!115 = !DILocation(line: 80, column: 9, scope: !104)
!116 = !DILocation(line: 80, column: 21, scope: !104)
!117 = !DILocation(line: 81, column: 20, scope: !104)
!118 = !DILocation(line: 81, column: 9, scope: !104)
!119 = !DILocation(line: 83, column: 1, scope: !84)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !12, line: 88, type: !16)
!122 = !DILocation(line: 88, column: 15, scope: !120)
!123 = !DILocalVariable(name: "dataBadBuffer", scope: !120, file: !12, line: 89, type: !22)
!124 = !DILocation(line: 89, column: 13, scope: !120)
!125 = !DILocalVariable(name: "dataGoodBuffer", scope: !120, file: !12, line: 90, type: !27)
!126 = !DILocation(line: 90, column: 13, scope: !120)
!127 = !DILocation(line: 91, column: 13, scope: !120)
!128 = !DILocation(line: 91, column: 5, scope: !120)
!129 = !DILocation(line: 92, column: 5, scope: !120)
!130 = !DILocation(line: 92, column: 25, scope: !120)
!131 = !DILocation(line: 93, column: 13, scope: !120)
!132 = !DILocation(line: 93, column: 5, scope: !120)
!133 = !DILocation(line: 94, column: 5, scope: !120)
!134 = !DILocation(line: 94, column: 27, scope: !120)
!135 = !DILocation(line: 98, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !137, file: !12, line: 96, column: 5)
!137 = distinct !DILexicalBlock(scope: !120, file: !12, line: 95, column: 8)
!138 = !DILocation(line: 98, column: 14, scope: !136)
!139 = !DILocalVariable(name: "dest", scope: !140, file: !12, line: 101, type: !27)
!140 = distinct !DILexicalBlock(scope: !120, file: !12, line: 100, column: 5)
!141 = !DILocation(line: 101, column: 17, scope: !140)
!142 = !DILocation(line: 102, column: 17, scope: !140)
!143 = !DILocation(line: 102, column: 9, scope: !140)
!144 = !DILocation(line: 103, column: 9, scope: !140)
!145 = !DILocation(line: 103, column: 21, scope: !140)
!146 = !DILocation(line: 106, column: 9, scope: !140)
!147 = !DILocation(line: 106, column: 23, scope: !140)
!148 = !DILocation(line: 106, column: 36, scope: !140)
!149 = !DILocation(line: 106, column: 29, scope: !140)
!150 = !DILocation(line: 106, column: 41, scope: !140)
!151 = !DILocation(line: 107, column: 9, scope: !140)
!152 = !DILocation(line: 107, column: 21, scope: !140)
!153 = !DILocation(line: 108, column: 20, scope: !140)
!154 = !DILocation(line: 108, column: 9, scope: !140)
!155 = !DILocation(line: 110, column: 1, scope: !120)
