; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_13_bad() #0 !dbg !11 {
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
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !39
  %cmp = icmp eq i32 %0, 5, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store i32* %arraydecay4, i32** %data, align 8, !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !47, metadata !DIExpression()), !dbg !49
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !51
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx7, align 4, !dbg !53
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !54
  %2 = load i32*, i32** %data, align 8, !dbg !55
  %3 = bitcast i32* %2 to i8*, !dbg !54
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !57
  %mul = mul i64 %call10, 4, !dbg !58
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !54
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx11, align 4, !dbg !60
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  call void @printWLine(i32* %arraydecay12), !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_13_good() #0 !dbg !64 {
entry:
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_13_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_13_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !95
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !96
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !100
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx3, align 4, !dbg !102
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !103
  %cmp = icmp ne i32 %0, 5, !dbg !105
  br i1 %cmp, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !107
  br label %if.end, !dbg !109

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i32* %arraydecay4, i32** %data, align 8, !dbg !112
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !117
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx7, align 4, !dbg !119
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !120
  %2 = load i32*, i32** %data, align 8, !dbg !121
  %3 = bitcast i32* %2 to i8*, !dbg !120
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !123
  %mul = mul i64 %call10, 4, !dbg !124
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !120
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx11, align 4, !dbg !126
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  call void @printWLine(i32* %arraydecay12), !dbg !128
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !130 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !137
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !138
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !139
  store i32 0, i32* %arrayidx, align 4, !dbg !140
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !141
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !142
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !143
  store i32 0, i32* %arrayidx3, align 4, !dbg !144
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !145
  %cmp = icmp eq i32 %0, 5, !dbg !147
  br i1 %cmp, label %if.then, label %if.end, !dbg !148

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !149
  store i32* %arraydecay4, i32** %data, align 8, !dbg !151
  br label %if.end, !dbg !152

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !153, metadata !DIExpression()), !dbg !155
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !156
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !157
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !158
  store i32 0, i32* %arrayidx7, align 4, !dbg !159
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !160
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !160
  %2 = load i32*, i32** %data, align 8, !dbg !161
  %3 = bitcast i32* %2 to i8*, !dbg !160
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !162
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !163
  %mul = mul i64 %call10, 4, !dbg !164
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !160
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx11, align 4, !dbg !166
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  call void @printWLine(i32* %arraydecay12), !dbg !168
  ret void, !dbg !169
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_13_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_13.c", directory: "/root/SSE-Assessment")
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
!41 = !DILocation(line: 32, column: 25, scope: !40)
!42 = !DILocation(line: 32, column: 8, scope: !11)
!43 = !DILocation(line: 35, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 33, column: 5)
!45 = !DILocation(line: 35, column: 14, scope: !44)
!46 = !DILocation(line: 36, column: 5, scope: !44)
!47 = !DILocalVariable(name: "dest", scope: !48, file: !12, line: 38, type: !27)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!49 = !DILocation(line: 38, column: 17, scope: !48)
!50 = !DILocation(line: 39, column: 17, scope: !48)
!51 = !DILocation(line: 39, column: 9, scope: !48)
!52 = !DILocation(line: 40, column: 9, scope: !48)
!53 = !DILocation(line: 40, column: 21, scope: !48)
!54 = !DILocation(line: 43, column: 9, scope: !48)
!55 = !DILocation(line: 43, column: 23, scope: !48)
!56 = !DILocation(line: 43, column: 36, scope: !48)
!57 = !DILocation(line: 43, column: 29, scope: !48)
!58 = !DILocation(line: 43, column: 41, scope: !48)
!59 = !DILocation(line: 44, column: 9, scope: !48)
!60 = !DILocation(line: 44, column: 21, scope: !48)
!61 = !DILocation(line: 45, column: 20, scope: !48)
!62 = !DILocation(line: 45, column: 9, scope: !48)
!63 = !DILocation(line: 47, column: 1, scope: !11)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_13_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 114, column: 5, scope: !64)
!66 = !DILocation(line: 115, column: 5, scope: !64)
!67 = !DILocation(line: 116, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 128, type: !69, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!19, !19, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 128, type: !19)
!75 = !DILocation(line: 128, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 128, type: !71)
!77 = !DILocation(line: 128, column: 27, scope: !68)
!78 = !DILocation(line: 131, column: 22, scope: !68)
!79 = !DILocation(line: 131, column: 12, scope: !68)
!80 = !DILocation(line: 131, column: 5, scope: !68)
!81 = !DILocation(line: 133, column: 5, scope: !68)
!82 = !DILocation(line: 134, column: 5, scope: !68)
!83 = !DILocation(line: 135, column: 5, scope: !68)
!84 = !DILocation(line: 138, column: 5, scope: !68)
!85 = !DILocation(line: 139, column: 5, scope: !68)
!86 = !DILocation(line: 140, column: 5, scope: !68)
!87 = !DILocation(line: 142, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 56, type: !16)
!90 = !DILocation(line: 56, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !12, line: 57, type: !22)
!92 = !DILocation(line: 57, column: 13, scope: !88)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !12, line: 58, type: !27)
!94 = !DILocation(line: 58, column: 13, scope: !88)
!95 = !DILocation(line: 59, column: 13, scope: !88)
!96 = !DILocation(line: 59, column: 5, scope: !88)
!97 = !DILocation(line: 60, column: 5, scope: !88)
!98 = !DILocation(line: 60, column: 25, scope: !88)
!99 = !DILocation(line: 61, column: 13, scope: !88)
!100 = !DILocation(line: 61, column: 5, scope: !88)
!101 = !DILocation(line: 62, column: 5, scope: !88)
!102 = !DILocation(line: 62, column: 27, scope: !88)
!103 = !DILocation(line: 63, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !88, file: !12, line: 63, column: 8)
!105 = !DILocation(line: 63, column: 25, scope: !104)
!106 = !DILocation(line: 63, column: 8, scope: !88)
!107 = !DILocation(line: 66, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !12, line: 64, column: 5)
!109 = !DILocation(line: 67, column: 5, scope: !108)
!110 = !DILocation(line: 71, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !12, line: 69, column: 5)
!112 = !DILocation(line: 71, column: 14, scope: !111)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !12, line: 74, type: !27)
!114 = distinct !DILexicalBlock(scope: !88, file: !12, line: 73, column: 5)
!115 = !DILocation(line: 74, column: 17, scope: !114)
!116 = !DILocation(line: 75, column: 17, scope: !114)
!117 = !DILocation(line: 75, column: 9, scope: !114)
!118 = !DILocation(line: 76, column: 9, scope: !114)
!119 = !DILocation(line: 76, column: 21, scope: !114)
!120 = !DILocation(line: 79, column: 9, scope: !114)
!121 = !DILocation(line: 79, column: 23, scope: !114)
!122 = !DILocation(line: 79, column: 36, scope: !114)
!123 = !DILocation(line: 79, column: 29, scope: !114)
!124 = !DILocation(line: 79, column: 41, scope: !114)
!125 = !DILocation(line: 80, column: 9, scope: !114)
!126 = !DILocation(line: 80, column: 21, scope: !114)
!127 = !DILocation(line: 81, column: 20, scope: !114)
!128 = !DILocation(line: 81, column: 9, scope: !114)
!129 = !DILocation(line: 83, column: 1, scope: !88)
!130 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocalVariable(name: "data", scope: !130, file: !12, line: 88, type: !16)
!132 = !DILocation(line: 88, column: 15, scope: !130)
!133 = !DILocalVariable(name: "dataBadBuffer", scope: !130, file: !12, line: 89, type: !22)
!134 = !DILocation(line: 89, column: 13, scope: !130)
!135 = !DILocalVariable(name: "dataGoodBuffer", scope: !130, file: !12, line: 90, type: !27)
!136 = !DILocation(line: 90, column: 13, scope: !130)
!137 = !DILocation(line: 91, column: 13, scope: !130)
!138 = !DILocation(line: 91, column: 5, scope: !130)
!139 = !DILocation(line: 92, column: 5, scope: !130)
!140 = !DILocation(line: 92, column: 25, scope: !130)
!141 = !DILocation(line: 93, column: 13, scope: !130)
!142 = !DILocation(line: 93, column: 5, scope: !130)
!143 = !DILocation(line: 94, column: 5, scope: !130)
!144 = !DILocation(line: 94, column: 27, scope: !130)
!145 = !DILocation(line: 95, column: 8, scope: !146)
!146 = distinct !DILexicalBlock(scope: !130, file: !12, line: 95, column: 8)
!147 = !DILocation(line: 95, column: 25, scope: !146)
!148 = !DILocation(line: 95, column: 8, scope: !130)
!149 = !DILocation(line: 98, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !12, line: 96, column: 5)
!151 = !DILocation(line: 98, column: 14, scope: !150)
!152 = !DILocation(line: 99, column: 5, scope: !150)
!153 = !DILocalVariable(name: "dest", scope: !154, file: !12, line: 101, type: !27)
!154 = distinct !DILexicalBlock(scope: !130, file: !12, line: 100, column: 5)
!155 = !DILocation(line: 101, column: 17, scope: !154)
!156 = !DILocation(line: 102, column: 17, scope: !154)
!157 = !DILocation(line: 102, column: 9, scope: !154)
!158 = !DILocation(line: 103, column: 9, scope: !154)
!159 = !DILocation(line: 103, column: 21, scope: !154)
!160 = !DILocation(line: 106, column: 9, scope: !154)
!161 = !DILocation(line: 106, column: 23, scope: !154)
!162 = !DILocation(line: 106, column: 36, scope: !154)
!163 = !DILocation(line: 106, column: 29, scope: !154)
!164 = !DILocation(line: 106, column: 41, scope: !154)
!165 = !DILocation(line: 107, column: 9, scope: !154)
!166 = !DILocation(line: 107, column: 21, scope: !154)
!167 = !DILocation(line: 108, column: 20, scope: !154)
!168 = !DILocation(line: 108, column: 9, scope: !154)
!169 = !DILocation(line: 110, column: 1, scope: !130)
