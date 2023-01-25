; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_08_bad() #0 !dbg !11 {
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
  %call4 = call i32 @staticReturnsTrue(), !dbg !39
  %tobool = icmp ne i32 %call4, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay5, i32** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !48
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #6, !dbg !50
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx8, align 4, !dbg !52
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %0 = bitcast i32* %arraydecay9 to i8*, !dbg !53
  %1 = load i32*, i32** %data, align 8, !dbg !54
  %2 = bitcast i32* %1 to i8*, !dbg !53
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call11 = call i64 @wcslen(i32* %arraydecay10) #7, !dbg !56
  %mul = mul i64 %call11, 4, !dbg !57
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !53
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx12, align 4, !dbg !59
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* %arraydecay13), !dbg !61
  ret void, !dbg !62
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_08_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_08_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_08_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !87 {
entry:
  ret i32 1, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !98
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !99
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !102
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !103
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx3, align 4, !dbg !105
  %call4 = call i32 @staticReturnsFalse(), !dbg !106
  %tobool = icmp ne i32 %call4, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i32* %arraydecay5, i32** %data, align 8, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #6, !dbg !119
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx8, align 4, !dbg !121
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %0 = bitcast i32* %arraydecay9 to i8*, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %2 = bitcast i32* %1 to i8*, !dbg !122
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  %call11 = call i64 @wcslen(i32* %arraydecay10) #7, !dbg !125
  %mul = mul i64 %call11, 4, !dbg !126
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !122
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx12, align 4, !dbg !128
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  call void @printWLine(i32* %arraydecay13), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !132 {
entry:
  ret i32 0, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !141
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !142
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !143
  store i32 0, i32* %arrayidx, align 4, !dbg !144
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !145
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !146
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !147
  store i32 0, i32* %arrayidx3, align 4, !dbg !148
  %call4 = call i32 @staticReturnsTrue(), !dbg !149
  %tobool = icmp ne i32 %call4, 0, !dbg !149
  br i1 %tobool, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !152
  store i32* %arraydecay5, i32** %data, align 8, !dbg !154
  br label %if.end, !dbg !155

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !156, metadata !DIExpression()), !dbg !158
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !159
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #6, !dbg !160
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !161
  store i32 0, i32* %arrayidx8, align 4, !dbg !162
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  %0 = bitcast i32* %arraydecay9 to i8*, !dbg !163
  %1 = load i32*, i32** %data, align 8, !dbg !164
  %2 = bitcast i32* %1 to i8*, !dbg !163
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !165
  %call11 = call i64 @wcslen(i32* %arraydecay10) #7, !dbg !166
  %mul = mul i64 %call11, 4, !dbg !167
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !163
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !168
  store i32 0, i32* %arrayidx12, align 4, !dbg !169
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  call void @printWLine(i32* %arraydecay13), !dbg !171
  ret void, !dbg !172
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 41, column: 13, scope: !11)
!31 = !DILocation(line: 42, column: 13, scope: !11)
!32 = !DILocation(line: 42, column: 5, scope: !11)
!33 = !DILocation(line: 43, column: 5, scope: !11)
!34 = !DILocation(line: 43, column: 25, scope: !11)
!35 = !DILocation(line: 44, column: 13, scope: !11)
!36 = !DILocation(line: 44, column: 5, scope: !11)
!37 = !DILocation(line: 45, column: 5, scope: !11)
!38 = !DILocation(line: 45, column: 27, scope: !11)
!39 = !DILocation(line: 46, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 8)
!41 = !DILocation(line: 46, column: 8, scope: !11)
!42 = !DILocation(line: 49, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 47, column: 5)
!44 = !DILocation(line: 49, column: 14, scope: !43)
!45 = !DILocation(line: 50, column: 5, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !12, line: 52, type: !27)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 51, column: 5)
!48 = !DILocation(line: 52, column: 17, scope: !47)
!49 = !DILocation(line: 53, column: 17, scope: !47)
!50 = !DILocation(line: 53, column: 9, scope: !47)
!51 = !DILocation(line: 54, column: 9, scope: !47)
!52 = !DILocation(line: 54, column: 21, scope: !47)
!53 = !DILocation(line: 57, column: 9, scope: !47)
!54 = !DILocation(line: 57, column: 23, scope: !47)
!55 = !DILocation(line: 57, column: 36, scope: !47)
!56 = !DILocation(line: 57, column: 29, scope: !47)
!57 = !DILocation(line: 57, column: 41, scope: !47)
!58 = !DILocation(line: 58, column: 9, scope: !47)
!59 = !DILocation(line: 58, column: 21, scope: !47)
!60 = !DILocation(line: 59, column: 20, scope: !47)
!61 = !DILocation(line: 59, column: 9, scope: !47)
!62 = !DILocation(line: 61, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_08_good", scope: !12, file: !12, line: 126, type: !13, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 128, column: 5, scope: !63)
!65 = !DILocation(line: 129, column: 5, scope: !63)
!66 = !DILocation(line: 130, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 142, type: !68, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!19, !19, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 142, type: !19)
!74 = !DILocation(line: 142, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 142, type: !70)
!76 = !DILocation(line: 142, column: 27, scope: !67)
!77 = !DILocation(line: 145, column: 22, scope: !67)
!78 = !DILocation(line: 145, column: 12, scope: !67)
!79 = !DILocation(line: 145, column: 5, scope: !67)
!80 = !DILocation(line: 147, column: 5, scope: !67)
!81 = !DILocation(line: 148, column: 5, scope: !67)
!82 = !DILocation(line: 149, column: 5, scope: !67)
!83 = !DILocation(line: 152, column: 5, scope: !67)
!84 = !DILocation(line: 153, column: 5, scope: !67)
!85 = !DILocation(line: 154, column: 5, scope: !67)
!86 = !DILocation(line: 156, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !88, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!19}
!90 = !DILocation(line: 27, column: 5, scope: !87)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 70, type: !16)
!93 = !DILocation(line: 70, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 71, type: !22)
!95 = !DILocation(line: 71, column: 13, scope: !91)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 72, type: !27)
!97 = !DILocation(line: 72, column: 13, scope: !91)
!98 = !DILocation(line: 73, column: 13, scope: !91)
!99 = !DILocation(line: 73, column: 5, scope: !91)
!100 = !DILocation(line: 74, column: 5, scope: !91)
!101 = !DILocation(line: 74, column: 25, scope: !91)
!102 = !DILocation(line: 75, column: 13, scope: !91)
!103 = !DILocation(line: 75, column: 5, scope: !91)
!104 = !DILocation(line: 76, column: 5, scope: !91)
!105 = !DILocation(line: 76, column: 27, scope: !91)
!106 = !DILocation(line: 77, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !91, file: !12, line: 77, column: 8)
!108 = !DILocation(line: 77, column: 8, scope: !91)
!109 = !DILocation(line: 80, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 78, column: 5)
!111 = !DILocation(line: 81, column: 5, scope: !110)
!112 = !DILocation(line: 85, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !12, line: 83, column: 5)
!114 = !DILocation(line: 85, column: 14, scope: !113)
!115 = !DILocalVariable(name: "dest", scope: !116, file: !12, line: 88, type: !27)
!116 = distinct !DILexicalBlock(scope: !91, file: !12, line: 87, column: 5)
!117 = !DILocation(line: 88, column: 17, scope: !116)
!118 = !DILocation(line: 89, column: 17, scope: !116)
!119 = !DILocation(line: 89, column: 9, scope: !116)
!120 = !DILocation(line: 90, column: 9, scope: !116)
!121 = !DILocation(line: 90, column: 21, scope: !116)
!122 = !DILocation(line: 93, column: 9, scope: !116)
!123 = !DILocation(line: 93, column: 23, scope: !116)
!124 = !DILocation(line: 93, column: 36, scope: !116)
!125 = !DILocation(line: 93, column: 29, scope: !116)
!126 = !DILocation(line: 93, column: 41, scope: !116)
!127 = !DILocation(line: 94, column: 9, scope: !116)
!128 = !DILocation(line: 94, column: 21, scope: !116)
!129 = !DILocation(line: 95, column: 20, scope: !116)
!130 = !DILocation(line: 95, column: 9, scope: !116)
!131 = !DILocation(line: 97, column: 1, scope: !91)
!132 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !88, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocation(line: 32, column: 5, scope: !132)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", scope: !134, file: !12, line: 102, type: !16)
!136 = !DILocation(line: 102, column: 15, scope: !134)
!137 = !DILocalVariable(name: "dataBadBuffer", scope: !134, file: !12, line: 103, type: !22)
!138 = !DILocation(line: 103, column: 13, scope: !134)
!139 = !DILocalVariable(name: "dataGoodBuffer", scope: !134, file: !12, line: 104, type: !27)
!140 = !DILocation(line: 104, column: 13, scope: !134)
!141 = !DILocation(line: 105, column: 13, scope: !134)
!142 = !DILocation(line: 105, column: 5, scope: !134)
!143 = !DILocation(line: 106, column: 5, scope: !134)
!144 = !DILocation(line: 106, column: 25, scope: !134)
!145 = !DILocation(line: 107, column: 13, scope: !134)
!146 = !DILocation(line: 107, column: 5, scope: !134)
!147 = !DILocation(line: 108, column: 5, scope: !134)
!148 = !DILocation(line: 108, column: 27, scope: !134)
!149 = !DILocation(line: 109, column: 8, scope: !150)
!150 = distinct !DILexicalBlock(scope: !134, file: !12, line: 109, column: 8)
!151 = !DILocation(line: 109, column: 8, scope: !134)
!152 = !DILocation(line: 112, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !12, line: 110, column: 5)
!154 = !DILocation(line: 112, column: 14, scope: !153)
!155 = !DILocation(line: 113, column: 5, scope: !153)
!156 = !DILocalVariable(name: "dest", scope: !157, file: !12, line: 115, type: !27)
!157 = distinct !DILexicalBlock(scope: !134, file: !12, line: 114, column: 5)
!158 = !DILocation(line: 115, column: 17, scope: !157)
!159 = !DILocation(line: 116, column: 17, scope: !157)
!160 = !DILocation(line: 116, column: 9, scope: !157)
!161 = !DILocation(line: 117, column: 9, scope: !157)
!162 = !DILocation(line: 117, column: 21, scope: !157)
!163 = !DILocation(line: 120, column: 9, scope: !157)
!164 = !DILocation(line: 120, column: 23, scope: !157)
!165 = !DILocation(line: 120, column: 36, scope: !157)
!166 = !DILocation(line: 120, column: 29, scope: !157)
!167 = !DILocation(line: 120, column: 41, scope: !157)
!168 = !DILocation(line: 121, column: 9, scope: !157)
!169 = !DILocation(line: 121, column: 21, scope: !157)
!170 = !DILocation(line: 122, column: 20, scope: !157)
!171 = !DILocation(line: 122, column: 9, scope: !157)
!172 = !DILocation(line: 124, column: 1, scope: !134)
